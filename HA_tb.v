`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 06:26:19 PM
// Design Name: 
// Module Name: HA_tb
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


module HA_tb(

    );
    reg Port_A;
    reg Port_B;
    wire Port_S;
    wire Port_Cout;
    
    //name the chip
    HA CHIP(
            .A(Port_A),
            .B(Port_B),
            .S(Port_S),
            .Cout(Port_Cout)
    );
    //writing data
    initial 
        begin : TST
        Port_A = 0;
        Port_B = 0;
        #20
        Port_B = 1;
        #20
        Port_A = 1;
        Port_B = 0;
        #20
        Port_A = 0;
        Port_B = 0;
        #40
        $finish;
        
        end
endmodule
