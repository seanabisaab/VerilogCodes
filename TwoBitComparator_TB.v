`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 09:58:40 PM
// Design Name: 
// Module Name: TwoBitComparator_TB
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


module TwoBitComparator_TB(
    );
    reg [1:0] A_TB;
    reg [1:0] B_TB;
    wire EQ_TB;
TwoBitComparator CHIP(
    .A(A_TB),
    .B(B_TB),
    .EQ(EQ_TB)
);

 integer i;  //index for A
 integer j; //index for B
    
generate
    initial 
        begin: COMPTB
            for(i = 0; i < 2; i = i + 1)
                begin: A_LOOP
                    #20
                    A_TB = i;
                    for(j = 0; j < 2; j = j + 1)
                        begin: B_LOOP
                        #20
                        B_TB = j;
                end
                end
        #60
        $finish;
        end
endgenerate
endmodule
