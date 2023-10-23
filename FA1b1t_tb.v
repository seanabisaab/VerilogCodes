`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 07:36:39 PM
// Design Name: 
// Module Name: FA1bit_TB
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


module FA1bit_TB(
    );
        reg [2:0] fa_port_input_tb;
        wire [1:0] fa_port_output_tb;
        
    FA1bit TB1(
        .fa_port_input(fa_port_input_tb),
       // input fa_port_a,
        //input fa_port_b,
        //input fa_port_cin,
        .fa_port_output(fa_port_output_tb)
        //output fa_port_sum,
        //output fa_port_cout
    );
    integer i;
    initial
        begin
            for (i = 0; i < 8; i = + 1)
                begin 
                    #20
                    fa_port_input_tb = i;  
                end
          #40
          $finish;
        end
endmodule
