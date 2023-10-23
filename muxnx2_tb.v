`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 08:30:06 PM
// Design Name: 
// Module Name: muxnx2_tb
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
module muxnx2_tb #(parameter M_TB =16)
    (
    );
    reg [M_TB-1:0] muxnx2_I0_tb;
    reg [M_TB-1:0] muxnx2_I1_tb;
    reg muxnx2_sel_tb;
    wire [M_TB-1:0] muxnx2_out_tb;
    
    muxnx2 #(.M(M_TB)) CHP
    (
        .muxnx2_port_sel(muxnx2_sel_tb),
        .muxnx2_port_I0(muxnx2_I0_tb),
        .muxnx2_port_I1(muxnx2_I1_tb),
        .muxnx2_port_out(muxnx2_out_tb)
    );
    
    integer i;  //index for sel
    integer j;  //index for I0
    integer k;  //index for I1
    
    initial
            begin: MUXNX1_TB
                for (i = 0; i < 2; i = i + 1)
                    begin: SEL_LOOP
                        muxnx2_sel_tb = i;
                        #20
                        for(j = 0; j < M_TB; j = j + 1)
                            begin: I0_LOOP
                                muxnx2_I0_tb = j;
                                #20
                                for(k = 0; k < M_TB; k = k + 1)
                                    begin: I0_LOOP
                                        #20
                                        muxnx2_I1_tb = k;
                                    end
                            end
                    end
            #60
            $finish;
            end
endmodule


