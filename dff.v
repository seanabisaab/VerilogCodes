`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 06:40:46 PM
// Design Name: 
// Module Name: dff
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


module dff(
    input dff_cport_clk,
    input dff_cport_rst,
    input dff_cport_en,
    input dff_iport_d,
    output dff_oport_q
    );
reg dff_tport_tmp;
always @(posedge dff_cport_clk)
    begin: DFF_OP
        if(dff_cport_rst)
        dff_tport_tmp <= 1'b0;
            begin: PROCESSING
            if(dff_cport_en)
            dff_tport_tmp <= dff_iport_d;
            end
    end
    assign dff_oport_q = dff_tport_tmp;
endmodule
