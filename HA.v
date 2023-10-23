`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 06:34:03 PM
// Design Name: 
// Module Name: Chip : HA
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


module HA(input A,
          input B,
          output S,
          output Cout
          );
              
          xor(S, A, B);
          and(Cout, A, B);
              
endmodule
