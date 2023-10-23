`timescale 1ns / 1ps
`define clock_period 10
`define step 10
`define iteration 1024
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 07:47:02 PM
// Design Name: 
// Module Name: dreg_param_TB
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

 
module dreg_param_TB #(parameter SIZE_TB = 16)
        (
        );
    reg dreg_param_cport_clk_tb;
    reg dreg_param_cport_rst_tb;
    reg dreg_param_cport_en_tb;
    reg dreg_param_cport_sp_tb;
    reg dreg_param_iport_si_tb;
    reg [SIZE_TB-1:0] dreg_param_ipport_pi;
    wire [SIZE_TB-1:0] dreg_param_oport_p_tb;
    
    initial
        begin
            dreg_param_cport_clk_tb = 1;
        end
    always
        begin
            #( `clock_period/2) dreg_param_cport_clk_tb = ~dreg_param_cport_clk_tb;
        end
dreg_param #(.SIZE(SIZE_TB)) CHPTST
    (
    .dreg_param_cport_clk(dreg_param_cport_clk_tb),
    .dreg_param_cport_rst(dreg_param_cport_rst_tb),
    .dreg_param_cport_en(dreg_param_cport_en_tb),
    .dreg_param_cport_sp(dreg_param_cport_sp_tb),
    .dreg_param_iport_si(dreg_param_iport_si_tb),
    .dreg_param_ipport_pi(dreg_param_ipport_pi_tb),
    .dreg_param_oport_p(dreg_param_oport_p_tb)
    );
    integer i;
    initial
    begin
        dreg_param_cport_rst_tb = 1;
        dreg_param_cport_en_tb = 1'bZ;
        dreg_param_iport_si_tb = 1'bZ;
    #( (`step/10)*(`clock_period))
        dreg_param_cport_rst_tb = 0;
        dreg_param_cport_en_tb = 1'b1;
        dreg_param_iport_si_tb = 1'b0;
    #( (`step/5)*(`clock_period))
for(i = 0; i < `iteration; i = i + 1)
        begin
        #(2* ( `clock_period))
        dreg_param_iport_si_tb = 1;
        end
    #((`step/5)*(`clock_period))
        dreg_param_cport_en_tb = 1'b0;
    
    $finish;   
    end
endmodule
