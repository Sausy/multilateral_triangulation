#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>


#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"
#include "freertos/event_groups.h"

#include "esp_system.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "driver/spi_master.h"
//#include <vector>

#define TRANSACTION_BUFFER_LENGTH 1032	/* 1K data + Header length 8 */
static unsigned char transaction_buffer[TRANSACTION_BUFFER_LENGTH];
static unsigned char response_buffer_[TRANSACTION_BUFFER_LENGTH];


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

/*
#define PIN_NUM_MISO 21 //nina 1
#define PIN_NUM_MOSI 20//nina 21
#define PIN_NUM_CLK  19//nina 29,  ,...19
#define PIN_NUM_CS   17//nina 28
#define PIN_NUM_WP   -1
#define PIN_NUM_HD   -1

#define BSP_QSPI_SCK_PIN 19
#define BSP_QSPI_CSN_PIN 17
#define BSP_QSPI_IO0_PIN 20
#define BSP_QSPI_IO1_PIN 21
#define BSP_QSPI_IO2_PIN 22
#define BSP_QSPI_IO3_PIN 23

#define SPIS_MISO_PIN 12 // SPI MISO signal.
#define SPIS_CSN_PIN 11 // SPI CSN signal.
#define SPIS_MOSI_PIN 13 // SPI MOSI signal.
#define SPIS_SCK_PIN 14 // SPI SCK signal.

#define SPIM0_SCK_PIN 14 // SPI clock GPIO pin number.
#define SPIM0_MOSI_PIN 13 // SPI Master Out Slave In GPIO pin number.
#define SPIM0_MISO_PIN 12 // SPI Master In Slave Out GPIO pin number.
#define SPIM0_SS_PIN 11 // SPI Slave Select GPIO pin number.

#define PIN_NUM_MISO 25
#define PIN_NUM_MOSI 23
#define PIN_NUM_CLK  19
#define PIN_NUM_CS   22*/

#define ALTERA_IDLE_CHAR 0x4a

#define BYTESIDLECHAR 0x4a
#define BYTESESCCHAR  0x4d

#define STATIC_MEMORY_ALLOC
//#define DYNAMIC_MEMORY_ALLOC

#define TAG_SPI "SPI"



//------ AVALON BRIDGE ----
class spi_interface{
  public:
    spi_interface();

    void test();
    void foo();
    void create_test_data(unsigned char* buffer, int length);
    uint32_t get_data(uint32_t base_addr, uint32_t inc_address);

    //addr_base *addr;// = nullptr;

    int foo_fuck_off;

  private:

    esp_err_t ret;
    spi_device_handle_t spi;
    spi_bus_config_t buscfg={PIN_NUM_MOSI,PIN_NUM_MISO,PIN_NUM_CLK,PIN_NUM_WP,PIN_NUM_HD};//,0,0,0}; //.max_transfer_sz=PARALLEL_LINES*320*2+8  <= could be added

    /*
    int mosi_io_num;                ///< GPIO pin for Master Out Slave In (=spi_d) signal, or -1 if not used.
    int miso_io_num;                ///< GPIO pin for Master In Slave Out (=spi_q) signal, or -1 if not used.
    int sclk_io_num;                ///< GPIO pin for Spi CLocK signal, or -1 if not used.
    int quadwp_io_num;              ///< GPIO pin for WP (Write Protect) signal which is used as D2 in 4-bit communication modes, or -1 if not used.
    int quadhd_io_num;              ///< GPIO pin for HD (HolD) signal which is used as D3 in 4-bit communication modes, or -1 if not used.
    int max_transfer_sz;            ///< Maximum transfer size, in bytes. Defaults to 4094 if 0.
    uint32_t flags;                 ///< Abilities of bus to be checked by the driver. Or-ed value of ``SPICOMMON_BUSFLAG_*`` flags.
    int intr_flags
    */


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


    #ifdef STATIC_MEMORY_ALLOC	/* Buffer size allocated is sufficient for up to 1K data transaction only */
    #define BYTE_BUFFER_LENGTH		4136 	/* PACKET_BUFFER_LENGTH * 2 (for special characters) */
    unsigned char send_byte_buffer[BYTE_BUFFER_LENGTH];
    unsigned char response_byte_buffer[BYTE_BUFFER_LENGTH];
    #endif

    #ifdef STATIC_MEMORY_ALLOC	/* Buffer size allocated is sufficient for up to 1K data transaction only */
    #define PACKET_BUFFER_LENGTH		2068 	/* TRANSACTION_BUFFER_LENGTH * 2 (for special characters) + 4 (EOP/SOP/CHAN/ESC) */
    unsigned char send_packet_buffer[PACKET_BUFFER_LENGTH];
    unsigned char response_packet_buffer[PACKET_BUFFER_LENGTH];
    #endif

    //#ifdef STATIC_MEMORY_ALLOC	/* Buffer size allocated is sufficient for up to 1K data transaction only */
    //#define TRANSACTION_BUFFER_LENGTH 1032	/* 1K data + Header length 8 */
    //unsigned char transaction_buffer[TRANSACTION_BUFFER_LENGTH];
    //unsigned char response_buffer_[TRANSACTION_BUFFER_LENGTH];
    //#endif



    // --------------------------------------------------------------
    // Convert byte to SPI core bits and from SPI core bits to byte
    // --------------------------------------------------------------
    unsigned char byte_to_core_convert (unsigned int send_length,
    							 unsigned char* send_data,
    							 unsigned int response_length,
    							 unsigned char* response_data);
     // --------------------------------------------------------------
     // Call to SPI driver function , alt_avalon_spi_command()
     // --------------------------------------------------------------
     int spi_command(unsigned int base, unsigned int slave,
                     unsigned int write_length, const unsigned char * write_data,
                     unsigned int read_length, unsigned char * read_data,
                     unsigned int flags);
    unsigned char xor_20(unsigned char val);

    // -------------------------------
    // Convert packet to byte and byte to packet
    // -------------------------------
    unsigned char packet_to_byte_convert (unsigned int send_length,
    								unsigned char* send_data,
    								unsigned int response_length,
    								unsigned char* response_data);

    // ------------------------------------------------------
    // Perform an Avalon-MM write transaction of burst_length
    // bytes to the specified address.
    // ------------------------------------------------------
    unsigned char transaction_channel_write (unsigned int address,
    							unsigned int burst_length,
    							unsigned char* data_buffer,
    							unsigned char sequential);

    // -------------------------------------------------------
    // Perform an Avalon-MM read transaction of burst_length
    // bytes to the specified address.
    // -------------------------------------------------------
    unsigned char transaction_channel_read  (unsigned int address,
    							unsigned int burst_length,
    							unsigned char* data_buffer,
    							unsigned char sequential);

    unsigned char do_transaction(unsigned char trans_type, unsigned int size,  unsigned int address, unsigned char* data);

};
