# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# compile C with /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_FLAGS = -mlongcalls -Wno-frame-address  

C_DEFINES = -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DUNITY_INCLUDE_CONFIG_H -DWITH_POSIX

C_INCLUDES = -I/home/sausy/esp/esp-idf/components/wpa_supplicant/include -I/home/sausy/esp/esp-idf/components/wpa_supplicant/port/include -I/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/config -I/home/sausy/esp/esp-idf/components/newlib/platform_include -I/home/sausy/esp/esp-idf/components/newlib/include -I/home/sausy/esp/esp-idf/components/freertos/include -I/home/sausy/esp/esp-idf/components/heap/include -I/home/sausy/esp/esp-idf/components/log/include -I/home/sausy/esp/esp-idf/components/soc/esp32/include -I/home/sausy/esp/esp-idf/components/soc/include -I/home/sausy/esp/esp-idf/components/esp_rom/include -I/home/sausy/esp/esp-idf/components/esp_common/include -I/home/sausy/esp/esp-idf/components/xtensa/include -I/home/sausy/esp/esp-idf/components/xtensa/esp32/include -I/home/sausy/esp/esp-idf/components/esp32/include -I/home/sausy/esp/esp-idf/components/app_update/include -I/home/sausy/esp/esp-idf/components/spi_flash/include -I/home/sausy/esp/esp-idf/components/bootloader_support/include -I/home/sausy/esp/esp-idf/components/mbedtls/port/include -I/home/sausy/esp/esp-idf/components/mbedtls/mbedtls/include -I/home/sausy/esp/esp-idf/components/lwip/include/apps -I/home/sausy/esp/esp-idf/components/lwip/include/apps/sntp -I/home/sausy/esp/esp-idf/components/lwip/lwip/src/include -I/home/sausy/esp/esp-idf/components/lwip/port/esp32/include -I/home/sausy/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/sausy/esp/esp-idf/components/vfs/include -I/home/sausy/esp/esp-idf/components/esp_wifi/include -I/home/sausy/esp/esp-idf/components/driver/include -I/home/sausy/esp/esp-idf/components/esp_ringbuf/include -I/home/sausy/esp/esp-idf/components/esp_event/include -I/home/sausy/esp/esp-idf/components/tcpip_adapter/include -I/home/sausy/esp/esp-idf/components/ethernet/include -I/home/sausy/esp/esp-idf/components/efuse/include -I/home/sausy/esp/esp-idf/components/efuse/esp32/include -I/home/sausy/esp/esp-idf/components/pthread/include -I/home/sausy/esp/esp-idf/components/app_trace/include -I/home/sausy/esp/esp-idf/components/nvs_flash/include -I/home/sausy/esp/esp-idf/components/smartconfig_ack/include -I/home/sausy/esp/esp-idf/components/espcoredump/include -I/home/sausy/esp/esp-idf/components/asio/asio/asio/include -I/home/sausy/esp/esp-idf/components/asio/port/include -I/home/sausy/esp/esp-idf/components/coap/port/include -I/home/sausy/esp/esp-idf/components/coap/port/include/coap -I/home/sausy/esp/esp-idf/components/coap/libcoap/include -I/home/sausy/esp/esp-idf/components/coap/libcoap/include/coap2 -I/home/sausy/esp/esp-idf/components/console/. -I/home/sausy/esp/esp-idf/components/nghttp/port/include -I/home/sausy/esp/esp-idf/components/nghttp/nghttp2/lib/includes -I/home/sausy/esp/esp-idf/components/esp-tls/. -I/home/sausy/esp/esp-idf/components/esp_adc_cal/include -I/home/sausy/esp/esp-idf/components/tcp_transport/include -I/home/sausy/esp/esp-idf/components/esp_http_client/include -I/home/sausy/esp/esp-idf/components/esp_http_server/include -I/home/sausy/esp/esp-idf/components/esp_https_ota/include -I/home/sausy/esp/esp-idf/components/openssl/include -I/home/sausy/esp/esp-idf/components/esp_https_server/include -I/home/sausy/esp/esp-idf/components/expat/expat/expat/lib -I/home/sausy/esp/esp-idf/components/expat/port/include -I/home/sausy/esp/esp-idf/components/wear_levelling/include -I/home/sausy/esp/esp-idf/components/sdmmc/include -I/home/sausy/esp/esp-idf/components/fatfs/src -I/home/sausy/esp/esp-idf/components/freemodbus/common/include -I/home/sausy/esp/esp-idf/components/idf_test/include -I/home/sausy/esp/esp-idf/components/jsmn/include -I/home/sausy/esp/esp-idf/components/json/cJSON -I/home/sausy/esp/esp-idf/components/libsodium/libsodium/src/libsodium/include -I/home/sausy/esp/esp-idf/components/libsodium/port_include -I/home/sausy/esp/esp-idf/components/mdns/include -I/home/sausy/esp/esp-idf/components/mqtt/esp-mqtt/include -I/home/sausy/esp/esp-idf/components/protobuf-c/protobuf-c -I/home/sausy/esp/esp-idf/components/protocomm/include/common -I/home/sausy/esp/esp-idf/components/protocomm/include/security -I/home/sausy/esp/esp-idf/components/protocomm/include/transports -I/home/sausy/esp/esp-idf/components/spiffs/include -I/home/sausy/esp/esp-idf/components/ulp/include -I/home/sausy/esp/esp-idf/components/unity/include -I/home/sausy/esp/esp-idf/components/unity/unity/src -I/home/sausy/esp/esp-idf/components/wifi_provisioning/include 
