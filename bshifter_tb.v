`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 08:16:52 PM
// Design Name: 
// Module Name: bshifter_tb
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


module bshifter_tb(
    );
    reg [3:0] din_tb;          // Input data
    reg [1:0] shift_amt_tb;    // Shift amount
    reg direction_tb;          // Shift direction (0 for left, 1 for right)
    wire [3:0] dout_tb;        // Output data

    // Instantiate the barrel shifter module
    bshifter TST (
        .din(din_tb),
        .shift_amt(shift_amt_tb),
        .direction(direction_tb),
        .dout(dout_tb)
    );

    integer i;
    integer j;
    integer k;
generate    
    always begin
        begin: BSHIFTER_LOOP
            for(i = 0; i < 2; i = i + 1)
                begin: DIRECTION_LOOP
                    direction_tb = i;
                    #40
                    for(j = 0; j < 4; j = j + 1)
                        begin: SHIFTAMT_LOOP
                            shift_amt_tb = j;
                            #40
                            for(k = 0; k < 16; k = k + 1)
                                begin: DIN_LOOP
                                    #20
                                    din_tb = k;
                                end
                        end
                end
        #60
        $finish;
        end
    end
endgenerate
endmodule
