`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 08:31:34 PM
// Design Name: 
// Module Name: swc
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


module swc(
    input swc_clk,
    input swc_rst,
    input swc_en,
    input swc_sel,
    input swc_dsel,
    output [3:0] swc_q
    );
    reg [3:0] swc_tmp = 15;
    always@(posedge swc_clk)
        begin: swc_OP
        if (swc_dsel) //1 counts up else counts down
            begin
                if(swc_rst)
                    swc_tmp <=4'b0000;
                else
                    begin: UPEN_RCT
                    if(swc_en)
                        swc_tmp <= swc_tmp + 1;
                        if(swc_sel && (swc_tmp == 9))
                            swc_tmp <= 4'd0;
                    end
            end
        else 
            begin
                if(swc_rst && !swc_sel)
                    swc_tmp <=4'b1111;
                else if(swc_rst && swc_sel)
                    swc_tmp <=4'b1001;
                else
                    begin: EN_RCT
                    if(swc_en)
                        swc_tmp <= swc_tmp - 1;
                        if(swc_sel && (swc_tmp == 0))
                            swc_tmp <= 4'b1001;
                    end
            end
        end
        assign swc_q = swc_tmp;
endmodule
