/*
* Copyright 2018 ARDUINO SA (http://www.arduino.cc/)
* This file is part of Vidor IP.
* Copyright (c) 2018
* Authors: Dario Pennisi
*
* This software is released under:
* The GNU General Public License, which covers the main part of 
* Vidor IP
* The terms of this license can be found at:
* https://www.gnu.org/licenses/gpl-3.0.en.html
*
* You can be released from the requirements of the above licenses by purchasing
* a commercial license. Buying such a license is mandatory if you want to modify or
* otherwise use the software for commercial activities involving the Arduino
* software without disclosing the source code of your own applications. To purchase
* a commercial license, send an email to license@arduino.cc.
*
*/

module MKRVIDOR4000_top
(
  // system signals
  input         iCLK,
  input         iRESETn,
  input         iSAM_INT,
  output        oSAM_INT,
  
  // SDRAM
  output        oSDRAM_CLK,
  output [11:0] oSDRAM_ADDR,
  output [1:0]  oSDRAM_BA,
  output        oSDRAM_CASn,
  output        oSDRAM_CKE,
  output        oSDRAM_CSn,
  inout  [15:0] bSDRAM_DQ,
  output [1:0]  oSDRAM_DQM,
  output        oSDRAM_RASn,
  output        oSDRAM_WEn,

  // SAM D21 PINS
  inout         bMKR_AREF,
  inout  [6:0]  bMKR_A,
  inout  [14:0] bMKR_D,
  
  // Mini PCIe
  inout         bPEX_RST,
  inout         bPEX_PIN6,
  inout         bPEX_PIN8,
  inout         bPEX_PIN10,
  input         iPEX_PIN11,
  inout         bPEX_PIN12,
  input         iPEX_PIN13,
  inout         bPEX_PIN14,
  inout         bPEX_PIN16,
  inout         bPEX_PIN20,
  input         iPEX_PIN23,
  input         iPEX_PIN25,
  inout         bPEX_PIN28,
  inout         bPEX_PIN30,
  input         iPEX_PIN31,
  inout         bPEX_PIN32,
  input         iPEX_PIN33,
  inout         bPEX_PIN42,
  inout         bPEX_PIN44,
  inout         bPEX_PIN45,
  inout         bPEX_PIN46,
  inout         bPEX_PIN47,
  inout         bPEX_PIN48,
  inout         bPEX_PIN49,
  inout         bPEX_PIN51,

  // NINA interface
  inout         bWM_PIO1,
  inout         bWM_PIO2,
  inout         bWM_PIO3,
  inout         bWM_PIO4,
  inout         bWM_PIO5,
  inout         bWM_PIO7,
  inout         bWM_PIO8,
  inout         bWM_PIO18,
  inout         bWM_PIO20,
  inout         bWM_PIO21,
  inout         bWM_PIO27,
  inout         bWM_PIO28,
  inout         bWM_PIO29,
  inout         bWM_PIO31,
  input         iWM_PIO32,
  inout         bWM_PIO34,
  inout         bWM_PIO35,
  inout         bWM_PIO36,
  input         iWM_TX,
  inout         oWM_RX,
  inout         oWM_RESET,

  // HDMI output
  output [2:0]  oHDMI_TX,
  output        oHDMI_CLK,

  inout         bHDMI_SDA,
  inout         bHDMI_SCL,
  
  input         iHDMI_HPD,
  
  // MIPI input
  input  [1:0]  iMIPI_D,
  input         iMIPI_CLK,
  inout         bMIPI_SDA,
  inout         bMIPI_SCL,
  inout  [1:0]  bMIPI_GP,

  // Q-SPI Flash interface
  output        oFLASH_SCK,
  output        oFLASH_CS,
  inout         oFLASH_MOSI,
  inout         iFLASH_MISO,
  inout         oFLASH_HOLD,
  inout         oFLASH_WP

);

// signal declaration

wire        wOSC_CLK;

wire        wCLK8,wCLK24, wCLK64, wCLK120;

wire [31:0] wJTAG_ADDRESS, wJTAG_READ_DATA, wJTAG_WRITE_DATA, wDPRAM_READ_DATA;
wire        wJTAG_READ, wJTAG_WRITE, wJTAG_WAIT_REQUEST, wJTAG_READ_DATAVALID;
wire [4:0]  wJTAG_BURST_COUNT;
wire        wDPRAM_CS;

wire [7:0]  wDVI_RED,wDVI_GRN,wDVI_BLU;
wire        wDVI_HS, wDVI_VS, wDVI_DE;

wire        wVID_CLK, wVID_CLKx5;
wire        wMEM_CLK;

assign wVID_CLK   = wCLK24;
assign wVID_CLKx5 = wCLK120;
assign wCLK8      = iCLK;


//=====================
reg						PIEZO_enable_reg;
reg 						PIEZO_out;
wire						PIEZO_in;
wire 	[3:0]	ID_select;

//---SPI--
reg [7:0] rFPGA_STATUS;
reg [7:0] rREG1;
reg [7:0] rREG2;

wire [7:0] wSPI_RCV_BYTE;
wire [7:0] wSPI_RCV_CMD;

wire wSPI_INC_WRADDR;
wire [4:0] wSPI_PERIPH_SLCT;
wire wSPI_WRITE_SIG;
//=====================


    test_programm u0 (
        .clk_clk                    							(iCLK),                    //       clk.clk
        .reset_reset_n              				(iRESETn),              //     reset.reset_n
        .spislave0_ispi_in          			(bMKR_D[8]),          // spislave0.ispi_in
        .spislave0_ispi_send_byte 	(rFPGA_STATUS),   //          .ispi_send_byte
        .spislave0_ispi_ss_n        		(iSAM_INT),        //          .ispi_ss_n
        .spislave0_ospi_inc_wraddr	(wSPI_INC_WRADDR),  //          .ospi_inc_wraddr
        .spislave0_ospi_out         		(bMKR_D[10]),         //          .ospi_out
        .spislave0_ospi_periph_slct	(wSPI_PERIPH_SLCT), //          .ospi_periph_slct
        .spislave0_ospi_rcv_byte    	(wSPI_RCV_BYTE),    //          .ospi_rcv_byte
        .spislave0_ospi_rcv_cmd    	(wSPI_RCV_CMD),     //          .ospi_rcv_cmd
        .spislave0_ospi_write_sig   	(wSPI_WRITE_SIG)    //          .ospi_write_sig
    );
	 
// MAP -- IO's 
assign bMKR_D[6] = PIEZO_enable_reg;
	 
	 
always @(posedge wSPI_WRITE_SIG, posedge iRESETn)
begin
		if (iRESETn == 1) begin
				PIEZO_enable_reg <= 1;
		end else begin
				if (wSPI_RCV_CMD[6:3] == 4'b0001)     begin
					PIEZO_enable_reg <= 1;
					if (wSPI_RCV_CMD[0] == 1'b0)  begin  
								rREG1 <= wSPI_RCV_BYTE;
					end else begin
								rREG2 <= wSPI_RCV_BYTE;
					end
				end
		end
end


// internal oscillator
cyclone10lp_oscillator   osc
  ( 
  .clkout(wOSC_CLK),
  .oscena(1'b1)
  );

// system PLL
SYSTEM_PLL PLL_inst(
  .areset(1'b0),
  .inclk0(wCLK8),
  .c0(wCLK24),
  .c1(wCLK120),
  .c2(wMEM_CLK),
   .c3(oSDRAM_CLK),
  .c4(wFLASH_CLK),
   
  .locked()
  );


reg [5:0] rRESETCNT;

always @(posedge wMEM_CLK)
begin
  if (!rRESETCNT[5])
  begin
  rRESETCNT<=rRESETCNT+1;
  end
end

endmodule
