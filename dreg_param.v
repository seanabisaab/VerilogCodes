`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 07:33:35 PM
// Design Name: 
// Module Name: dreg_param
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


module dreg_param #(parameter SIZE = 512)
    (
    input dreg_param_cport_clk,
    input dreg_param_cport_rst,
    input dreg_param_cport_en,
    input dreg_param_cport_sp,
    input dreg_param_iport_si,
    input [SIZE-1:0] dreg_param_ipport_pi,
    output [SIZE-1:0] dreg_param_oport_p
    );
    wire [SIZE:0] dreg_param_tport_tmp;
    wire [SIZE:0] dreg_param_tport_ptmp;
    assign dreg_param_tport_tmp[0] = dreg_param_iport_si;

genvar i;
generate
for (i = 0; i < SIZE; i = i + 1)
    begin
        assign dreg_param_tport_tmp[i] = dreg_param_cport_sp ? dreg_param_tport_tmp[i]: dreg_param_ipport_pi[i];
        dff CHP(
            .dff_cport_clk(dreg_param_cport_clk),
            .dff_cport_rst(dreg_param_cport_rst),
            .dff_cport_en(dreg_param_cport_en),
            .dff_iport_d(dreg_param_tport_tmp[i]),
            .dff_oport_q(dreg_param_tport_tmp[i+1])
            );
        assign dreg_param_oport_p = dreg_param_tport_tmp[i+1];
    end
endgenerate
endmodule
