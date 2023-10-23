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


module dch(
    input dch_clk,
    input dch_rst,
    input dch_en,
    input dch_sel,
    output [3:0] dch_q
    );
    reg [3:0] dch_tmp = 15;
    always@(posedge dch_clk)
        begin: DCH_OP
        if(dch_rst && !dch_sel)
            dch_tmp <=4'b1111;
        else if(dch_rst && dch_sel)
            dch_tmp <=4'b1001;
        else
            begin: EN_RCT
            if(dch_en)
                dch_tmp <= dch_tmp - 1;
                if(dch_sel && (dch_tmp == 0))
                    dch_tmp <= 4'b1001;
            end
        end
        assign dch_q = dch_tmp;
endmodule
