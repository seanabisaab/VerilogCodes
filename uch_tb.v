`timescale 1ns / 1ps
`define clock_period 10
`define step 10
`define iteration 16
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 02:33:24 PM
// Design Name: 
// Module Name: uch_tb
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


module uch_tb(
    );
    reg uch_clk_tb;
    reg uch_rst_tb;
    reg uch_en_tb;
    reg uch_sel_tb;
    wire [3:0] uch_q_tb;
    
    initial
        begin
            uch_clk_tb = 1;
        end
    always
        begin
            #( `clock_period/2) uch_clk_tb = ~uch_clk_tb;
        end
uch CHPTEST (
    .uch_clk(uch_clk_tb),
    .uch_rst(uch_rst_tb),
    .uch_en(uch_en_tb),
    .uch_sel(uch_sel_tb),
    .uch_q(uch_q_tb)
    );

integer i;
    initial
    begin
        uch_rst_tb = 1;
        uch_en_tb = 1'bZ;
        uch_sel_tb = 1'bZ;
    #( (`step/10)*(`clock_period))
        uch_rst_tb = 0;
        uch_en_tb = 1'b1;
        uch_sel_tb = 1'b1;
    #( (`step/5)*(`clock_period))
for(i = 0; i < `iteration/2.1; i = i + 1)
        begin
            #(2* ( `clock_period))
            uch_sel_tb = 1;
        end
for(i = 0; i < `iteration/2.1; i = i + 1)
        begin
            #(2* ( `clock_period))
            uch_sel_tb = 0;
        end
    #((`step/5)*(`clock_period))
        uch_en_tb = 1'b0;
    
    $finish;   
    end
endmodule
