`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 08:31:34 PM
// Design Name: 
// Module Name: uch
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


module uch(
    input uch_clk,
    input uch_rst,
    input uch_en,
    input uch_sel,
    output [3:0] uch_q
    );
    reg [3:0] uch_tmp;
    
    always@(posedge uch_clk)
        begin: UCH_OP
        if(uch_rst)
            uch_tmp <=4'b0000;
        else
            begin: EN_RCT
            if(uch_en)
                uch_tmp <= uch_tmp + 1;
                if(uch_sel && (uch_tmp == 9))
                    uch_tmp <= 4'd0;
            end
        end
        assign uch_q = uch_tmp;
endmodule
