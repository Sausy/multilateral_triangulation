#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "esp_wifi.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include "esp_event_loop.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"
#include "freertos/event_groups.h"

#include "lwip/sockets.h"
#include "lwip/dns.h"
#include "lwip/netdb.h"

#include "esp_log.h"
#include "mqtt_client.h"
#include "driver/spi_master.h"

//#include "fpgainterface.hpp"

static const char *TAG = "MQTT_SAMPLE";

static EventGroupHandle_t wifi_event_group;
static EventGroupHandle_t spi_event_group;
const static int CONNECTED_BIT = BIT0;
const static int SPI_CONNECTED_BIT = BIT1;

#define BUFFER_LENGTH		1024

// -----------------------------------------------------------------------
// INCREMENT ADDRESS - starting from the given address, data will be
//						read/write to incrementing address
// NON_INCREMEMT_ADDRESS - data will read/write only to the given address
//(If data size is more than 4 bytes, the 1st four data will be overwrite
//	by the next 4 bytes , due to non-increment address
// -----------------------------------------------------------------------
#define INCREMENT_ADDRESS			1
#define NON_INCREMENT_ADDRESS		0

// ------------------------------------
// Transaction opcodes
// ------------------------------------
#define SEQUENTIAL_WRITE 0x04
#define SEQUENTIAL_READ  0x14
#define NON_SEQUENTIAL_WRITE 0x00
#define NON_SEQUENTIAL_READ  0x10

#define HEADER_LEN 8
#define RESPONSE_LEN 4

#define SOP     0x7a
#define EOP     0x7b
#define CHANNEL 0x7c
#define ESC     0x7d

#define PIN_NUM_MISO 12 //nina 1
#define PIN_NUM_MOSI 13//nina 21
#define PIN_NUM_CLK  14//nina 29,  ,...19
#define PIN_NUM_CS   11//nina 28
#define PIN_NUM_WP   -1
#define PIN_NUM_HD   -1


#define TAG_SPI "SPI"









/*
static esp_err_t spi_event_handler(void *ctx, system_event_t *event)
{
    switch (event->event_id) {
        case SYSTEM_EVENT_STA_START:
            break;
        case SYSTEM_EVENT_STA_GOT_IP:
            xEventGroupSetBits(spi_event_group, CONNECTED_BIT);

            break;
        case SYSTEM_EVENT_STA_DISCONNECTED:
            xEventGroupClearBits(spi_event_group, CONNECTED_BIT);
            break;
        default:
            break;
    }
    return ESP_OK;
}*/

static esp_err_t mqtt_event_handler(esp_mqtt_event_handle_t event)
{
    esp_mqtt_client_handle_t client = event->client;
    int msg_id;
    // your_context_t *context = event->context;
    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_CONNECTED");
            msg_id = esp_mqtt_client_subscribe(client, "/topic/qos0", 0);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_subscribe(client, "/topic/qos1", 1);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_unsubscribe(client, "/topic/qos1");
            ESP_LOGI(TAG, "sent unsubscribe successful, msg_id=%d", msg_id);
            break;
        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_DISCONNECTED");
            break;

        case MQTT_EVENT_SUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_SUBSCRIBED, msg_id=%d", event->msg_id);
            msg_id = esp_mqtt_client_publish(client, "/topic/qos0", "data", 0, 0, 0);
            ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);
            break;
        case MQTT_EVENT_UNSUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_UNSUBSCRIBED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_PUBLISHED:
            ESP_LOGI(TAG, "MQTT_EVENT_PUBLISHED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_DATA:
            ESP_LOGI(TAG, "MQTT_EVENT_DATA");
            printf("TOPIC=%.*s\r\n", event->topic_len, event->topic);
            printf("DATA=%.*s\r\n", event->data_len, event->data);
            break;
        case MQTT_EVENT_ERROR:
            ESP_LOGI(TAG, "MQTT_EVENT_ERROR");
            break;
    }
    return ESP_OK;
}

static esp_err_t wifi_event_handler(void *ctx, system_event_t *event)
{
    switch (event->event_id) {
        case SYSTEM_EVENT_STA_START:
            esp_wifi_connect();
            break;
        case SYSTEM_EVENT_STA_GOT_IP:
            xEventGroupSetBits(wifi_event_group, CONNECTED_BIT);

            break;
        case SYSTEM_EVENT_STA_DISCONNECTED:
            esp_wifi_connect();
            xEventGroupClearBits(wifi_event_group, CONNECTED_BIT);
            break;
        default:
            break;
    }
    return ESP_OK;
}

static void spi_avalon_bridge(void){
  //spi_event_group = xEventGroupCreate();
  //ESP_ERROR_CHECK(esp_event_loop_init(spi_event_handler, NULL));


  ESP_LOGI("HW", "Start HW Interface");
  //hardware_interface hw;
  ESP_LOGI("HW", "DONE");

}

static void wifi_init(void)
{
    tcpip_adapter_init();
    wifi_event_group = xEventGroupCreate();
    ESP_ERROR_CHECK(esp_event_loop_init(wifi_event_handler, NULL));
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));

    wifi_ap_config_t wifi_cfg = {"roboy","wiihackroboy"};
    wifi_config_t wifi_config = {wifi_cfg};


    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config));
    //ESP_LOGI(TAG, "start the WIFI SSID:[%s] password:[%s]", sta_config.sta.ssid, sta_config.sta.password);
    ESP_ERROR_CHECK(esp_wifi_start());
    ESP_LOGI(TAG, "Waiting for wifi");
    xEventGroupWaitBits(wifi_event_group, CONNECTED_BIT, false, true, portMAX_DELAY);

}

static void mqtt_app_start(void)
{
  const esp_mqtt_client_config_t mqtt_cfg = {mqtt_event_handler, "mqtt://192.168.1.1", "mqtt://192.168.1.1"};

  /*mqtt_event_callback_t event_handle;
    const char *host;
    const char *uri;
    uint32_t port;
    const char *client_id;
    const char *username;
    const char *password;
    const char *lwt_topic;
    const char *lwt_msg;
    int lwt_qos;
    int lwt_retain;
    int lwt_msg_len;
    int disable_clean_session;
    int keepalive;
    bool disable_auto_reconnect;
    void *user_context;
    int task_prio;
    int task_stack;
    int buffer_size;
    const char *cert_pem;
    const char *client_cert_pem;
    const char *client_key_pem;
    esp_mqtt_transport_t transport;
*/

    esp_mqtt_client_handle_t client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_start(client);

}


extern "C" int app_main(void)
{

    ESP_LOGI(TAG, "[APP] Startup..");
    ESP_LOGI(TAG, "[APP] Free memory: %d bytes", esp_get_free_heap_size());
    ESP_LOGI(TAG, "[APP] IDF version: %s", esp_get_idf_version());

    esp_log_level_set("*", ESP_LOG_INFO);
    esp_log_level_set("MQTT_CLIENT", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_TCP", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_SSL", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT", ESP_LOG_VERBOSE);
    esp_log_level_set("OUTBOX", ESP_LOG_VERBOSE);



    nvs_flash_init();
    //wifi_init();
    //mqtt_app_start();
    //spi_avalon_bridge();

    esp_err_t ret;
    spi_device_handle_t spi;
    spi_bus_config_t buscfg={PIN_NUM_MOSI,PIN_NUM_MISO,PIN_NUM_CLK,PIN_NUM_WP,PIN_NUM_HD};//,0,0,0}; //.max_transfer_sz=PARALLEL_LINES*320*2+8  <= could be added



    spi_device_interface_config_t devcfg={ //0,0,0,0,0,0,0,26*1000*1000,PIN_NUM_CS,0,7};
      0,  //< Amount of bits in command phase (0-16)
      0,  //< Amount of bits in address phase (0-64)
      0,  //< Amount of dummy bits to insert between address and data phase
      0,  //< SPI mode (0-3)
      0,  //< Duty cycle of positive clock, in 1/256th increments (128 = 50%/50% duty). Setting this to 0 (=not setting it) is equivalent to setting this to 128.
      0,  //< Amount of SPI bit-cycles the cs should be activated before the transmission (0-16). This only works on half-duplex transactions.
      0,  //< Amount of SPI bit-cycles the cs should stay active after the transmission (0-16)
      26*1000*1000,    //< Clock speed, in Hz
      PIN_NUM_CS,    //< CS GPIO pin for this device, or -1 if not used
      0,   //< Bitwise OR of SPI_DEVICE_* flags
      7    //< Transaction queue size. This sets how many transactions can be 'in the air' (queued using spi_device_queue_trans but not yet finished using spi_device_get_trans_result) at the same time
          //< Callback to be called before a transmission is started. This callback is called within interrupt context.
      };

      //Initialize the SPI bus
      ret=spi_bus_initialize(HSPI_HOST, &buscfg, 1);
      ESP_ERROR_CHECK(ret);

      ret=spi_bus_add_device(HSPI_HOST, &devcfg, &spi);
      ESP_ERROR_CHECK(ret);

      ESP_LOGI(TAG_SPI,"SPI constructed\n");

    return 0;
}
