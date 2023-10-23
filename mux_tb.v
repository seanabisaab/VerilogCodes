`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 06:59:21 PM
// Design Name: 
// Module Name: mux_TB
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


module mux_TB(

    );
    reg sel_tb;
    reg I0_tb;
    reg I1_tb;
    wire out_tb;
    
    mux MOE_CHP(
                .sel(sel_tb),
                .I0(I0_tb),
                .I1(I1_tb),
                .out(out_tb)
                );
        integer i;  //index for sel
        integer j;  //index for I0
        integer k;  //index for I1
    initial
            begin: CHP_TST
                for (i = 0; i < 2; i = i + 1)
                    begin: SEL_LOOP
                        sel_tb = i;
                        #20
                        for(j = 0; j < 2; j = j + 1)
                            begin: I0_LOOP
                                I0_tb = j;
                                #20
                                for(k = 0; k < 2; k = k + 1)
                                    begin
                                    #20
                                    I1_tb = k;
                                    end
                            end
                    end
            #60
            $finish;
            end
endmodule
