#include "spi_interface.hpp"
#include "esp_log.h"

#define ONCHIP_MEM_FOR_BRIDGE_BASE 0x0
#define INCREMENT_ADDRESS 0x01

spi_interface::spi_interface(){
  //Initialize the SPI bus
  ret=spi_bus_initialize(HSPI_HOST, &buscfg, 1);
  ESP_ERROR_CHECK(ret);

  ret=spi_bus_add_device(HSPI_HOST, &devcfg, &spi);
  ESP_ERROR_CHECK(ret);
  
  ESP_LOGI(TAG_SPI,"SPI constructed\n");
}


uint32_t spi_interface::get_data(uint32_t base_addr, uint32_t inc_address){
  
  int i;
  unsigned char data_buffer[BUFFER_LENGTH];
  unsigned char read_buffer[BUFFER_LENGTH];
  
  uint32_t return_val = 0;
  
  transaction_channel_read (base_addr,
                BUFFER_LENGTH,
                &read_buffer[0],
                inc_address);
  return return_val;
}

void spi_interface::foo(){
    ESP_LOGI(TAG_SPI,"FOO test ...\n");
}


void spi_interface::test(){
  ESP_LOGI(TAG_SPI,"SPI test ...\n");
  int i;
  unsigned char data_buffer[BUFFER_LENGTH];
  unsigned char read_buffer[BUFFER_LENGTH];

  // ---------------------------------------------------
  //	Create random test data with size BUFFER_LENGTH
  // ---------------------------------------------------
  create_test_data(&data_buffer[0], BUFFER_LENGTH);

  // ---------------------------------------------------  0x40000
  //	Write to On Chip memory connected to SPI Bridge
  // ---------------------------------------------------
  ESP_LOGI(TAG_SPI,"Writing data to onchip memory ...");
  if(transaction_channel_write (ONCHIP_MEM_FOR_BRIDGE_BASE,
                  BUFFER_LENGTH,
                  &data_buffer[0],
                  INCREMENT_ADDRESS)){
      ESP_LOGI(TAG_SPI,"Write transaction successful");
  }
  else {
    ESP_LOGI(TAG_SPI,"Write transaction unsuccessful");
  }

  // ------------------------------------------------------
  //	Read back from On Chip Memory connected to SPI Bridge
  // ------------------------------------------------------
  ESP_LOGI(TAG_SPI,"Reading data from onchip memory ...");
  (transaction_channel_read (ONCHIP_MEM_FOR_BRIDGE_BASE,
                BUFFER_LENGTH,
                &read_buffer[0],
                INCREMENT_ADDRESS));

  // ------------------------------------------------------
  //	Compare data
  // ------------------------------------------------------
  ESP_LOGI(TAG_SPI,"Comparing data ...\n");
  for(i=0;i<BUFFER_LENGTH;i++){
      if(data_buffer[i]!=read_buffer[i]){
      break;
    }
    }

    if(i==BUFFER_LENGTH){
      ESP_LOGI(TAG_SPI,"Compare data completes error free");
    }
    else {
      ESP_LOGI(TAG_SPI,"Data doesn't match, error at index: %u",i);
  }
  
}

void spi_interface::create_test_data(unsigned char* buffer, int length)
{
    int i=0;

    for (i = 0; i < BUFFER_LENGTH; i++)
      buffer[i] = (0xFF & rand()) % 256;  // random values between 0 and 255

}




//========================================================================




/******************************************************************************
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
******************************************************************************/


int spi_interface::spi_command(unsigned int base, unsigned int slave, unsigned int write_length, const unsigned char * write_data,
                 unsigned int read_length, unsigned char * read_data, unsigned int flags)
{

	//----------------------------------------------------------------------------------------
  // alt_avalon_spi_command() is Altera's SPI Driver function. If you are using another SPI
	// driver, replace this with your own SPI Driver functions.
  //----------------------------------------------------------------------------------------
  esp_err_t ret_;
  spi_transaction_t t;

  memset(&t, 0, sizeof(t));       //Zero out the transaction

  t.length=write_length;                 //Len is in bytes, transaction length is in bits.
  t.rxlength=read_length;
  t.tx_buffer=write_data;               //Data
  t.rx_buffer=read_data; 
  t.user=(void*)1;                //D/C needs to be set to 1


  ret_=spi_device_polling_transmit(spi, &t);  //Transmit!
  assert(ret_==ESP_OK);

	return 0;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/


/******************************************************************************
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
******************************************************************************/



unsigned char spi_interface::byte_to_core_convert (unsigned int send_length, unsigned char* send_data,
								unsigned int response_length, unsigned char* response_data)
{
    unsigned int i;
    unsigned int packet_length = 0;
    unsigned char *send_packet;
    unsigned char *response_packet;
    unsigned char *p;
    unsigned char current_byte;

    //---------------------------------------------------------------------
    // The maximum length of the packet is going to be so we can allocate
    // a chunk of memory for it. Assuming worst case scenario is that each
    // data byte is escaped, so we double the memory allocation.
    //---------------------------------------------------------------------
    
#ifdef DYNAMIC_MEMORY_ALLOC
    unsigned int send_max_len = 2 * send_length;
    unsigned int response_max_len = 2 * response_length;
	
	send_packet = (unsigned char*) malloc (send_max_len * sizeof(unsigned char));
    if(send_packet == NULL)	ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");

    response_packet = (unsigned char*) malloc (response_max_len * sizeof(unsigned char));
    if(response_packet == NULL)	ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");
#endif
#ifdef STATIC_MEMORY_ALLOC
	unsigned int response_max_len = 2 * response_length;
	
	send_packet = &send_byte_buffer[0];

	response_packet = &response_byte_buffer[0];
#endif
    p = send_packet;

    for (i = 0; i < send_length; i++)
    {
        current_byte = send_data[i];
        //-----------------------------------------------
        // Check for Escape and Idle special characters.
        // If exists, insert Escape and XOR the next byte
        //-----------------------------------------------
        switch(current_byte)
        {
            case BYTESIDLECHAR:
                        *p++ = BYTESESCCHAR;
                        *p++ = xor_20(current_byte);
                        break;
            case BYTESESCCHAR:
                        *p++ = BYTESESCCHAR;
                        *p++ = xor_20(current_byte);
                        break;
            default:
                        *p++ = current_byte;
                        break;
        }

    }
    packet_length=p-send_packet;

    //---------------------------------------------------------
    // Use the SPI core access routine to transmit and receive
    //---------------------------------------------------------
    //spi_command(SPI_BASE,0,packet_length,send_packet,response_max_len,response_packet,0);
    spi_command(0,0,packet_length,send_packet,response_max_len,response_packet,0);

    
    //-----------------------------------------------------------------
    //Analyze response packet , reset pointer to start of response data
    //-----------------------------------------------------------------
	i=0;
	p = response_data;
	while(i < response_max_len)
	{
		current_byte = response_packet[i];
		//-----------------------------------------------
		// Check for Escape and Idle special characters.
		// If exists, ignore and XOR the next byte
		//-----------------------------------------------
		switch(current_byte)
		{
			case BYTESIDLECHAR:
				i++;
				break;

			case BYTESESCCHAR:
				i++;
				current_byte = response_packet[i];
				*p++ = xor_20(current_byte);
				i++;
				break;

			default:
				*p++ = current_byte;
				i++;
				break;
		}
	}
#ifdef DYNAMIC_MEMORY_ALLOC
	free(send_packet);
    free(response_packet);
#endif
    return 0;
}

unsigned char spi_interface::xor_20(unsigned char val)
{
    return val^0x20;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/



/******************************************************************************
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
******************************************************************************/

//------------------------------------
// Function prototypes
//------------------------------------

unsigned char spi_interface::packet_to_byte_convert (unsigned int send_length, unsigned char* send_data,
								unsigned int response_length, unsigned char* response_data)
{
    unsigned int i;
    unsigned int packet_length = 0;
    unsigned char *send_packet;
    unsigned char *response_packet;
    unsigned char *p;
    unsigned char current_byte;

    //--------------------------------------------------------------
    //To figure out what the maximum length of the packet is going
    // to be so we can allocate a chunk of memory for it.
    //
    // All packets start with an SOP byte, followed by a channel
    // id (2 bytes) and end with an EOP. That's 4 bytes.
    //
    // However, we have to escape characters that are the same
    // as any of the SOP/EOP/channel bytes. Worst case scenario
    // is that each data byte is escaped, which leads us to the
    // algorithm below.
    //---------------------------------------------------------------
    
#ifdef DYNAMIC_MEMORY_ALLOC
    unsigned int send_max_len = 2 * send_length + 4;
    unsigned int response_max_len = 2 * response_length + 4;
	
	send_packet = (unsigned char *) malloc (send_max_len * sizeof(unsigned char));
    if(send_packet == NULL)	ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");

    response_packet = (unsigned char *) malloc (response_max_len * sizeof(unsigned char));
    if(response_packet == NULL)	ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");
#endif
#ifdef STATIC_MEMORY_ALLOC
	unsigned int response_max_len = 2 * response_length + 4;
	
	send_packet = &send_packet_buffer[0];

	response_packet = &response_packet_buffer[0];
#endif
    p = send_packet;

    //------------------------------------
    // SOP
    //------------------------------------
    *p++ = SOP;

    //------------------------------------
    // Channel information. Only channel 0 is defined.
     //------------------------------------
    *p++ = CHANNEL;
    *p++ = 0x0;

    //------------------------------------
    // Append the data to the packet
    //------------------------------------
    for (i = 0; i < send_length; i++)
    {
        current_byte = send_data[i];
        //------------------------------------
        // EOP must be added before the last byte
        //------------------------------------
        if (i == send_length-1)
        {
            *p++ = EOP;
        }

        //------------------------------------
        // Escape data bytes which collide with our
        // special characters.
        //------------------------------------
        switch(current_byte)
        {
            case SOP:
                        *p++ = ESC;
                        *p++ = xor_20(current_byte);
                        break;
            case EOP:
                        *p++ = ESC;
                        *p++ = xor_20(current_byte);
                        break;
            case CHANNEL:
                        *p++ = ESC;
                        *p++ = xor_20(current_byte);
                        break;
            case ESC:
                        *p++ = ESC;
                        *p++ = xor_20(current_byte);
                        break;

            default:
                        *p++ = current_byte;
                        break;
        }

    }
    packet_length=p-send_packet;

	byte_to_core_convert(packet_length,send_packet,response_max_len,response_packet);
	//-----------------------------------------------------------------
	//Analyze response packet , reset pointer to start of response data
	//-----------------------------------------------------------------
	p = response_data;
	//-------------
	//Look for SOP
	//-------------
	for(i=0;i<response_max_len;i++){
		if(response_packet[i] == SOP) {
			i++;
			break;
		}
	}

	//-------------------------------
	//Continue parsing data after SOP
	//-------------------------------
	while(i < response_max_len)
	{
		current_byte = response_packet[i];

		switch(current_byte)
		{
			case ESC:
			case CHANNEL:
			case SOP:
				i++;
				current_byte = response_packet[i];
				*p++ = xor_20(current_byte);
				i++;
				break;

			//------------------------------------
			// Get a EOP, get the next last byte
			// and exit while loop
			//------------------------------------
			case EOP:
				i++;
				current_byte = response_packet[i];

				if((current_byte == ESC)||(current_byte == CHANNEL)||(current_byte == SOP)){
					i++;
					current_byte = response_packet[i];
					*p++ = xor_20(current_byte);
				}

				else *p++ = current_byte;

				i = response_max_len;
				break;

			default:
				*p++ = current_byte;
				i++;
				break;
		}
	}
#ifdef DYNAMIC_MEMORY_ALLOC
	free(send_packet);
    free(response_packet);
#endif
    return 0;
}


/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/


/******************************************************************************
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
******************************************************************************/


unsigned char spi_interface::transaction_channel_write (unsigned int address,
									unsigned int burst_length,
									unsigned char* data_buffer,
									unsigned char sequential)
{
    return sequential?do_transaction(SEQUENTIAL_WRITE, burst_length, address, data_buffer):do_transaction(NON_SEQUENTIAL_WRITE, burst_length, address, data_buffer);
}

unsigned char spi_interface::transaction_channel_read  (unsigned int address,
									unsigned int burst_length,
									unsigned char* data_buffer,
									unsigned char sequential)
{
    return sequential?do_transaction(SEQUENTIAL_READ, burst_length, address, data_buffer):do_transaction(NON_SEQUENTIAL_READ, burst_length, address, data_buffer);
}

unsigned char spi_interface::do_transaction(unsigned char trans_type,
								unsigned int size,
								unsigned int address,
								unsigned char* data)
{
    unsigned int i = 0;
    unsigned char result = 0;
    unsigned char header[8];
    unsigned char* transaction;
    unsigned char* response;
    unsigned char* p;


    //-------------------------
    // Make transaction header
    //-------------------------
    header[0] = trans_type;
    header[1] = 0;
    header[2] = (size >> 8) & 0xff;
    header[3] = (size & 0xff);
    header[4] = (address >> 24) & 0xff;
    header[5] = (address >> 16) & 0xff;
    header[6] = (address >> 8)  & 0xff;
    header[7] = (address & 0xff);
    
    ESP_LOGI(TAG_SPI,"do_transaction");
    
    //transaction_buffer[0] = 1;
    
    foo_fuck_off = 1;
    
    //try { transaction_buffer[0] = 1; } catch (const std::exception& e) { ESP_LOGI(TAG_SPI,"ERROR: %s", e.what()); }

    
    
    
    //DEBUG BEGIN
    //transaction = &transaction_buffer[0];
    //response = &response_buffer_[0];
    //p = transaction;
    
    //for (i = 0; i < HEADER_LEN; i++)
      //*p++ = header[i];

    
    
    //DEBUG END

    
  /*  switch(trans_type)
    {
        case NON_SEQUENTIAL_WRITE:
        case SEQUENTIAL_WRITE:
			//--------------------------------
			// Build up the write transaction
			//--------------------------------
#ifdef DYNAMIC_MEMORY_ALLOC
			transaction = (unsigned char *) malloc ((size + HEADER_LEN) * sizeof(unsigned char));
			if(transaction == NULL)		ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");

			response = (unsigned char *) malloc (RESPONSE_LEN * sizeof(unsigned char));
			if(response == NULL)	ESP_LOGI(TAG_SPI,"Allocating heap memory failed\n");
#endif
#ifdef STATIC_MEMORY_ALLOC
			transaction = &transaction_buffer[0];

			response = &response_buffer_[0];
#endif
			p = transaction;

			for (i = 0; i < HEADER_LEN; i++)
				*p++ = header[i];

			for (i = 0; i < size; i++)
				*p++ = *data++;

			//-----------------------------------------------
			// Send the header and data, get 4 byte response
			//-----------------------------------------------
			packet_to_byte_convert (size + HEADER_LEN, transaction, RESPONSE_LEN, response);

			//------------------------------------------------------------------
			// Check return number of bytes in the 3rd and 4th byte of response
			//------------------------------------------------------------------
			if (size == (((unsigned int)(response[2]& 0xff)<<8)|((unsigned int)(response[3]&0xff))))
				result = 1;
#ifdef DYNAMIC_MEMORY_ALLOC
			free(transaction);
			free(response);
#endif
			break;

        case NON_SEQUENTIAL_READ:
        case SEQUENTIAL_READ:
#ifdef DYNAMIC_MEMORY_ALLOC
        	response = (unsigned char *) malloc (size * sizeof(unsigned char));
        	if(response == NULL)
        		ESP_LOGI(TAG_SPI,"Allocating heap memory failed");
#endif
#ifdef STATIC_MEMORY_ALLOC
			response = &response_buffer_[0];
#endif
        	//--------------------------------------------
        	// Send the header, get n size byte response
        	//--------------------------------------------
        	packet_to_byte_convert (HEADER_LEN, header, size, response);

			for (i = 0; i < size; i++)
				*data++ = *response++;

			//-------------------------------------------------------------------
			// Read do not return number of bytes , assume result always set to 1
			//-------------------------------------------------------------------
			result = 1;
#ifdef DYNAMIC_MEMORY_ALLOC
			free(response);
#endif
			break;

        default:
			break;
    }

    if(result)return 1;
    else return 0;
    */
    return 0;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2010 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
