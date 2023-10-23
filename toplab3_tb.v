`timescale 1ns / 1ps
`define clock_period 10
`define step 10
`define iteration 1024
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


module top_tb(
    );
    reg sys_clk_tb;
    reg top_rst_tb;
    reg top_en_tb;
    reg top_sel_tb;
    wire [6:0] top_cc_tb;
    wire [7:0] top_an_tb;

    
    initial
        begin
            sys_clk_tb = 1;
        end
    always
        begin
            #( `clock_period/2) sys_clk_tb = ~sys_clk_tb;
        end
top CHPTEST (
    .sys_clk(sys_clk_tb),
    .top_rst(top_rst_tb),
    .top_en(top_en_tb),
    .top_sel(top_sel_tb),
    .top_cc(top_cc_tb),
    .top_an(top_an_tb)
    );

integer i;
    initial
    begin
        top_rst_tb = 1;
        top_en_tb = 1'bZ;
        top_sel_tb = 1'bZ;
    #( (`step/10)*(`clock_period))
        top_rst_tb = 0;
        top_en_tb = 1'b1;
        top_sel_tb = 1'b0;
    #( (`step/5)*(`clock_period))
for(i = 0; i < `iteration; i = i + 1)
        begin
        #(2* ( `clock_period))
        top_sel_tb = 1;
        end
    #((`step/5)*(`clock_period))
        top_en_tb = 1'b0;
    
    $finish;   
    end
endmodule
