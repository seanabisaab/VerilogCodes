`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 12:14:59 AM
// Design Name: 
// Module Name: top
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


module top(
    input sys_clk,
    input top_rst,
    input top_en,
    input top_sel,
    output [6:0] top_cc,
    output [7:0] top_an
    );
    wire top_clk;
ClkDivider DIVIDER(
    .ClkDivider_clk(sys_clk),
    .ClkDivider_rst(0),
.   ClkDivider_divout(top_clk)
    );
    wire [3:0] top_q;
uch COUNTER (
    .uch_clk(top_clk),
    .uch_rst(top_rst),
    .uch_en(top_en),
    .uch_sel(top_sel),
    .uch_q(top_q)
    );
    
ssd_driver DISP 
    (
    .ssd_driver_port_inp(top_q),
    .ssd_driver_port_cc(top_cc),
    .ssd_driver_port_an(top_an)
    );
    endmodule
