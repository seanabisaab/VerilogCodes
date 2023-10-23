`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 08:03:20 PM
// Design Name: 
// Module Name: muxnx2
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


module muxnx2 #(parameter M =16)
    (
    input [M-1:0] muxnx2_port_I0,
    input [M-1:0] muxnx2_port_I1,
    input muxnx2_port_sel,
    output [M-1:0] muxnx2_port_out
    );
    genvar i;
generate
for (i = 0; i < M; i = i + 1)
    begin
        muxnx1 #(.SIZE(2)) CELL
        (
        .muxnx1_port_sel(muxnx2_port_sel),
        .muxnx1_port_i({muxnx2_port_I1[i], muxnx2_port_I0[i]}),
        .muxnx1_port_out(muxnx2_port_out[i])
        );
    end
endgenerate
endmodule
