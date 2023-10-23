`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 07:21:28 PM
// Design Name: 
// Module Name: FAnbit_RCA_TB
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


module FAnbit_RCA_TB    #(parameter SIZE_TB = 16)
        (
        );
    reg [SIZE_TB-1:0] fanbit_rca_port_a_tb;
    reg [SIZE_TB-1:0] fanbit_rca_port_b_tb;
    reg fanbit_rca_port_cin_tb;

/*............................................*/
    wire [SIZE_TB-1:0] fanbit_rca_port_sum_tb;
    wire fanbit_rca_port_cout_tb;
/*............................................*/
    
    FAnbit_RCA  #(.SIZE(SIZE_TB))   GENFATB
                    (
                    .Port_A(fanbit_rca_port_a_tb),
                    .Port_B(fanbit_rca_port_b_tb),
                    .Cin(fanbit_rca_port_cin_tb),
                    .Port_Sum(fanbit_rca_port_sum_tb),
                    .Cout(fanbit_rca_port_cout_tb)
                    );
/*............................................*/
integer i, j, k;
/*............................................*/
        initial
                begin:INTTEST
                    for (i = 0; i < 2; i = i+1)
                    begin:fanbit_port_cin_cases
                   #20
                    fanbit_rca_port_cin_tb = i;
                        for (j = 0; j < SIZE_TB; j = j+1)
                        begin:fanbit_port_a_cases
                       #20
                        fanbit_rca_port_a_tb = j;
                            for (k = 0; k < SIZE_TB; k = k+1)
                            begin:fanbit_port_b_cases
                           #20
                            fanbit_rca_port_b_tb = k;
                            end
                         end         
                      end      
                #40
                $finish;
                end
endmodule
