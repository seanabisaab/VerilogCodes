`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 06:10:12 PM
// Design Name: 
// Module Name: ssd_driver_TB
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


module ssd_driver_TB 
    (
    );
    reg [3:0] ssd_driver_port_inp_tb;
    reg ssd_driver_port_idp_tb;
    wire [3:0] ssd_driver_port_led_tb;
    wire [6:0] ssd_driver_port_cc_tb;
    wire ssd_driver_port_odp_tb;
    wire [7:0] ssd_driver_port_an_tb;
    
ssd_driver CHPTEST 
    (
    .ssd_driver_port_inp(ssd_driver_port_inp_tb),
    .ssd_driver_port_idp(ssd_driver_port_idp_tb),
    .ssd_driver_port_led(ssd_driver_port_led_tb),
    .ssd_driver_port_cc(ssd_driver_port_cc_tb),
    .ssd_driver_port_odp(ssd_driver_port_odp_tb),
    .ssd_driver_port_an(ssd_driver_port_an_tb)
    );
    integer i;
    integer j; 
generate    
    always begin
        begin: SSD_DRIVER
            for(i = 0; i < 2; i = i + 1)
                begin: DP_LOOP
                    ssd_driver_port_idp_tb = i;
                    #40
                    for(j = 0; j < 16; j = j + 1)
                        begin: INP_LOOP
                            #20
                            ssd_driver_port_inp_tb = j;
                        end
                end
        #60
        $finish;
        end
    end
endgenerate
endmodule
