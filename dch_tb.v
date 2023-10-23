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


module dch_tb(
    );
    reg dch_clk_tb;
    reg dch_rst_tb;
    reg dch_en_tb;
    reg dch_sel_tb;
    wire [3:0] dch_q_tb;
    
    initial
        begin
            dch_clk_tb = 1;
        end
    always
        begin
            #( `clock_period/2) dch_clk_tb = ~dch_clk_tb;
        end
dch CHPTEST (
    .dch_clk(dch_clk_tb),
    .dch_rst(dch_rst_tb),
    .dch_en(dch_en_tb),
    .dch_sel(dch_sel_tb),
    .dch_q(dch_q_tb)
    );

integer i;
    initial
    begin
        dch_rst_tb = 1;
        dch_en_tb = 1'bZ;
        dch_sel_tb = 1'bZ;
    #( (`step/10)*(`clock_period))
        dch_rst_tb = 0;
        dch_en_tb = 1'b1;
        dch_sel_tb = 1'b1;
    #( (`step/5)*(`clock_period))
for(i = 0; i < `iteration/2.1; i = i + 1)
        begin
            #(2* ( `clock_period))
            dch_sel_tb = 1;
        end
for(i = 0; i < `iteration/2.1; i = i + 1)
        begin
            #(2* ( `clock_period))
            dch_sel_tb = 0;
        end
    #((`step/5)*(`clock_period))
        dch_en_tb = 1'b0;
    
    $finish;   
    end
endmodule
