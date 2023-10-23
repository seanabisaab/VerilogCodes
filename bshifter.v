`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 07:34:34 PM
// Design Name: 
// Module Name: bshifter
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


module bshifter(
 input wire [3:0] din,        // 4-bit input data
    input wire [1:0] shift_amt, // 2-bit shift amount
    input wire direction,       // 0 for left shift, 1 for right shift
    output wire [3:0] dout      // 4-bit shifted output data
);

    reg [3:0] shifted_data;

    always @(*) begin
        if (direction == 0) begin // Left shift
            shifted_data = din << shift_amt;
        end else begin            // Right shift
            shifted_data = din >> shift_amt;
        end
    end

    assign dout = shifted_data;

endmodule
