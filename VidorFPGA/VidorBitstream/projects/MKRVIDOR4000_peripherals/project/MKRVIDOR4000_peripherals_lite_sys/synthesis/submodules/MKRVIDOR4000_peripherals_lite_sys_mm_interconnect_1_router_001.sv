// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/18.1std/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2018/07/18 $
// $Author: psgswbuild $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module MKRVIDOR4000_peripherals_lite_sys_mm_interconnect_1_router_001_default_decode
  #(
     parameter DEFAULT_CHANNEL = 0,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 16 
   )
  (output [110 - 106 : 0] default_destination_id,
   output [24-1 : 0] default_wr_channel,
   output [24-1 : 0] default_rd_channel,
   output [24-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[110 - 106 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 24'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 24'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 24'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module MKRVIDOR4000_peripherals_lite_sys_mm_interconnect_1_router_001
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [124-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [124-1    : 0] src_data,
    output reg [24-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 110;
    localparam PKT_DEST_ID_L = 106;
    localparam PKT_PROTECTION_H = 114;
    localparam PKT_PROTECTION_L = 112;
    localparam ST_DATA_W = 124;
    localparam ST_CHANNEL_W = 24;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h800000 - 64'h0); 
    localparam PAD1 = log2ceil(64'ha00000 - 64'h800000); 
    localparam PAD2 = log2ceil(64'ha08000 - 64'ha00000); 
    localparam PAD3 = log2ceil(64'ha08800 - 64'ha08000); 
    localparam PAD4 = log2ceil(64'ha09420 - 64'ha09400); 
    localparam PAD5 = log2ceil(64'ha09440 - 64'ha09420); 
    localparam PAD6 = log2ceil(64'ha09460 - 64'ha09440); 
    localparam PAD7 = log2ceil(64'ha09500 - 64'ha09480); 
    localparam PAD8 = log2ceil(64'ha09540 - 64'ha09500); 
    localparam PAD9 = log2ceil(64'ha0b020 - 64'ha0b000); 
    localparam PAD10 = log2ceil(64'ha0b040 - 64'ha0b020); 
    localparam PAD11 = log2ceil(64'ha0b060 - 64'ha0b040); 
    localparam PAD12 = log2ceil(64'ha0b080 - 64'ha0b060); 
    localparam PAD13 = log2ceil(64'ha0b120 - 64'ha0b100); 
    localparam PAD14 = log2ceil(64'ha0b140 - 64'ha0b120); 
    localparam PAD15 = log2ceil(64'ha0b160 - 64'ha0b140); 
    localparam PAD16 = log2ceil(64'ha0b180 - 64'ha0b160); 
    localparam PAD17 = log2ceil(64'ha0b1a0 - 64'ha0b180); 
    localparam PAD18 = log2ceil(64'ha0b240 - 64'ha0b200); 
    localparam PAD19 = log2ceil(64'ha0b260 - 64'ha0b240); 
    localparam PAD20 = log2ceil(64'ha0b280 - 64'ha0b260); 
    localparam PAD21 = log2ceil(64'ha0b320 - 64'ha0b300); 
    localparam PAD22 = log2ceil(64'ha0b440 - 64'ha0b400); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'ha0b440;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [24-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    MKRVIDOR4000_peripherals_lite_sys_mm_interconnect_1_router_001_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x0 .. 0x800000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 24'h0   ) begin
            src_channel = 24'b00000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x800000 .. 0xa00000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 24'h800000   ) begin
            src_channel = 24'b00000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0xa00000 .. 0xa08000 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 24'ha00000   ) begin
            src_channel = 24'b01000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0xa08000 .. 0xa08800 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 24'ha08000   ) begin
            src_channel = 24'b10000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0xa09400 .. 0xa09420 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 24'ha09400   ) begin
            src_channel = 24'b00000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0xa09420 .. 0xa09440 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 24'ha09420   ) begin
            src_channel = 24'b00001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0xa09440 .. 0xa09460 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 24'ha09440   ) begin
            src_channel = 24'b00010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0xa09480 .. 0xa09500 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 24'ha09480  && write_transaction  ) begin
            src_channel = 24'b00000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0xa09500 .. 0xa09540 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 24'ha09500  && read_transaction  ) begin
            src_channel = 24'b00000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0xa0b000 .. 0xa0b020 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 24'ha0b000   ) begin
            src_channel = 24'b00000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0xa0b020 .. 0xa0b040 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 24'ha0b020   ) begin
            src_channel = 24'b00000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0xa0b040 .. 0xa0b060 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 24'ha0b040   ) begin
            src_channel = 24'b00000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0xa0b060 .. 0xa0b080 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 24'ha0b060   ) begin
            src_channel = 24'b00000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0xa0b100 .. 0xa0b120 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 24'ha0b100   ) begin
            src_channel = 24'b00000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0xa0b120 .. 0xa0b140 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 24'ha0b120   ) begin
            src_channel = 24'b00000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0xa0b140 .. 0xa0b160 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 24'ha0b140   ) begin
            src_channel = 24'b00000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0xa0b160 .. 0xa0b180 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 24'ha0b160   ) begin
            src_channel = 24'b00000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0xa0b180 .. 0xa0b1a0 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 24'ha0b180   ) begin
            src_channel = 24'b00000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0xa0b200 .. 0xa0b240 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 24'ha0b200   ) begin
            src_channel = 24'b00000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0xa0b240 .. 0xa0b260 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 24'ha0b240   ) begin
            src_channel = 24'b00000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0xa0b260 .. 0xa0b280 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 24'ha0b260   ) begin
            src_channel = 24'b00000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0xa0b300 .. 0xa0b320 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 24'ha0b300   ) begin
            src_channel = 24'b00100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0xa0b400 .. 0xa0b440 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 24'ha0b400   ) begin
            src_channel = 24'b00000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


