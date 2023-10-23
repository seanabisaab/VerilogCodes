`timescale 1ns / 1ps
`define clock_period 10
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 06:47:02 PM
// Design Name: 
// Module Name: dff_TB
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


module dff_TB(
    );
    reg dff_cport_clk_tb;
    reg dff_cport_rst_tb;
    reg dff_cport_en_tb;
    reg dff_iport_d_tb;
    wire dff_oport_q_tb;
    
    //generating clock 100 MHz
    initial
            begin: INIT_CLK
                dff_cport_clk_tb = 1;
            end
    always
        begin:PERIODIC_UPDATE
            #( `clock_period/2) dff_cport_clk_tb =  ~dff_cport_clk_tb;
        end
    
dff CHP(
        .dff_cport_clk(dff_cport_clk_tb),
        .dff_cport_rst(dff_cport_rst_tb),
        .dff_cport_en(dff_cport_en_tb),
        .dff_iport_d(dff_iport_d_tb),
        .dff_oport_q(dff_oport_clk_q_tb)
    );
    initial
        begin: TST1
            dff_cport_rst_tb = 1;
            dff_cport_en_tb = 1'bZ;
            dff_iport_d_tb = 1'bZ;
        #( 3 * `clock_period)
            dff_cport_rst_tb = 1;
            dff_cport_en_tb = 1'b0;
        #( 5 * `clock_period)
            dff_iport_d_tb = 1'b1;
        #( 10 * `clock_period)
            dff_cport_en_tb = 1'b1;
    #(100 * `clock_period)
        $finish;

        end
endmodule
