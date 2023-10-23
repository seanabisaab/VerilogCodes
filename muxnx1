`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 07:18:20 PM
// Design Name: 
// Module Name: muxnx1
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


module muxnx1 #(parameter SIZE = 32)
    (
    input [$clog2(SIZE)-1:0] muxnx1_port_sel,
    input [SIZE-1:0] muxnx1_port_i,
    output muxnx1_port_out
    );
    assign muxnx1_port_out = muxnx1_port_i[muxnx1_port_sel];
endmodule
