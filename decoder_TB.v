`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sean Abi Saab
// 
// Create Date: 09/20/2023 01:08:31 PM
// Design Name: 
// Module Name: decoderTB
// Project Name: 4x16 Decoder
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_TB(
    );
    reg [3:0] in_tb;
    wire [15:0] out_tb;

    decoder CHIP(
        .in(in_tb),
        .out(out_tb)
        );

    integer i;  //index for in
    
generate
    initial 
        begin: decoderTB
            for(i = 0; i < 16; i = i + 1)
                begin: IN_LOOP
                    #20
                    in_tb = i;
                end
        #60
        $finish;
        end
endgenerate
endmodule
