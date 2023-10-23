`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 09:58:01 PM
// Design Name: 
// Module Name: TwoBitComparator
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


module TwoBitComparator(
    input [1:0] A,
    input [1:0] B,
    output reg EQ
    );
    always @* begin
        if (A == B) begin
            assign EQ = 1;
        end else begin
            assign EQ = 0;
        end
    end
endmodule
