`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CalPoly, Pomona
// Engineer: Sean Abi Saab
// 
// Create Date: 09/11/2023 08:17:33 PM
// Design Name: Reconfigurable FANBIT
// Module Name: FANbit_RCA
// Project Name: Evening Hello World    
// Target Devices: Artix - 7
// Tool Versions: 2023.1
// Description: Using Parameterized factor on slaing up N-bit FA based on Ripple Carry Adder Approach
// 
// Dependencies: Two HA written in gate level modeling which built a FA1BIT
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FAnbit_RCA   #(parameter SIZE = 4)
                    (
                    input [SIZE-1:0] Port_A,
                    input [SIZE-1:0] Port_B,
                    input Cin,
                    output [SIZE-1:0] Port_Sum,
                    output Cout
                    );
    wire [SIZE:0] FAnbit_RCA_wire_internal;
    
    genvar i;

    generate
    for (i = 0; i < SIZE; i = i+1)
    begin
        FA1bit FAGEN(
                .Port_A(Port_A[i]),
                .Port_B(Port_B[i]),
                .Port_Cin(FAnbit_RCA_wire_internal[i]),
                .Port_Sum(Port_Sum[i]),
                .Port_Cout(FAnbit_RCA_wire_internal[i+1])
                );
    end
    endgenerate
    
            assign FAnbit_RCA_wire_internal[0] = Cin;
            assign Cout = FAnbit_RCA_wire_internal[SIZE];
    
endmodule
