`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 07:23:44 PM
// Design Name: 
// Module Name: muxnx1_TB
// Project Name: 
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


module muxnx1_TB #(parameter SIZE_TB = 16)
(
    );
    reg [$clog2(SIZE_TB)-1:0] muxnx1_sel_tb;
    reg [SIZE_TB-1:0] muxnx1_i_tb;
    wire muxnx1_out_tb;
    
    muxnx1 #(.SIZE(SIZE_TB)) CHP 
                   (
                   .muxnx1_port_sel(muxnx1_sel_tb),
                   .muxnx1_port_i(muxnx1_i_tb),
                   .muxnx1_port_out(muxnx1_out_tb)
                   );
    
        integer i;  //index for sel
        integer j;  //index for I
        
        initial
            begin: MUXNX1_TB
                for (i = 0; i < $clog2(SIZE_TB); i = i + 1)
                    begin: SEL_LOOP
                        muxnx1_sel_tb = i;
                        #20
                        for(j = 0; j < SIZE_TB; j = j + 1)
                            begin: I_LOOP
                                #20
                                muxnx1_i_tb = j;
                            end
                    end
            #60
            $finish;
            end
endmodule
