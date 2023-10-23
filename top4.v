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


module top4(
    input sys_clk,
    input top_rst,
    input top_en,
    input top_sel,
    input top_dsel,
    input top_idp,
    output [6:0] top_cc,
    output [7:0] top_an,
    output top_odp
    );
    wire top_clk;
ClkDivider DIVIDER(
    .ClkDivider_clk(sys_clk),
    .ClkDivider_rst(0),
.   ClkDivider_div(top_clk)
    );
    wire [3:0] top_q;
swc COUNTER (
    .swc_clk(top_clk),
    .swc_rst(top_rst),
    .swc_en(top_en),
    .swc_sel(top_sel),
    .swc_dsel(top_dsel),
    .swc_q(top_q)
    );
    
ssd_driver DISP 
    (
    .ssd_driver_port_inp(top_q),
    .ssd_driver_port_idp(top_idp),
    .ssd_driver_port_odp(top_odp),
    .ssd_driver_port_cc(top_cc),
    .ssd_driver_port_an(top_an)
    );
    endmodule
