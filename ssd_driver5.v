`timescale 1ns / 1ps

module ssd_driver5(
    input [7:0] ssd_driver_port_inp,
    input ssd_clk,
    input ssd_rst,
    output [6:0] ssd_driver_port_cc,
    output [7:0]ssd_driver_port_an
    );
    
    reg[6:0] ssd_driver_tmp_cc;
    reg [7:0]ssd_driver_tmp_an = 8'hFE;
    wire[7:0] ssd_driver_digit;
    assign ssd_driver_digit = ssd_driver_port_inp;
    
    always@(posedge ssd_clk)
        begin
              if (ssd_driver_tmp_an == 8'hFD)
                    ssd_driver_tmp_an = 8'hFE;
              else if (ssd_driver_tmp_an == 8'hFE)
                    ssd_driver_tmp_an = 8'hFD;
                    
              if(ssd_rst)
                ssd_driver_tmp_cc = 7'b1000000;
              else
              begin
                    if (ssd_driver_tmp_an == 8'hFE) // Assign Second Digit AN[1]
                        begin
                        case(ssd_driver_digit[3:0])
                            4'h0:   ssd_driver_tmp_cc = 7'b1000000;
                            4'h1:   ssd_driver_tmp_cc = 7'b1111001;
                            4'h2:   ssd_driver_tmp_cc = 7'b0100100;
                            4'h3:   ssd_driver_tmp_cc = 7'b0110000;
                            4'h4:   ssd_driver_tmp_cc = 7'b0011001;
                            4'h5:   ssd_driver_tmp_cc = 7'b0010010;
                            4'h6:   ssd_driver_tmp_cc = 7'b0000010;
                            4'h7:   ssd_driver_tmp_cc = 7'b1111000;
                            4'h8:   ssd_driver_tmp_cc = 7'b0000000;
                            4'h9:   ssd_driver_tmp_cc = 7'b0011000;
                            4'hA:   ssd_driver_tmp_cc = 7'b0001000;
                            4'hB:   ssd_driver_tmp_cc = 7'b0000011;
                            4'hC:   ssd_driver_tmp_cc = 7'b1000110; 
                            4'hD:   ssd_driver_tmp_cc = 7'b0100001;
                            4'hE:   ssd_driver_tmp_cc = 7'b0000110;
                            4'hF:   ssd_driver_tmp_cc = 7'b0001110;
                            default: ssd_driver_tmp_cc = 7'hZZZZ;
                        endcase
                        end
                    else if (ssd_driver_tmp_an == 8'hFD) // Assign First Digit AN[0]
                        begin
                        case(ssd_driver_digit[7:4])
                            4'h0:   ssd_driver_tmp_cc = 7'b1000000;
                            4'h1:   ssd_driver_tmp_cc = 7'b1111001;
                            4'h2:   ssd_driver_tmp_cc = 7'b0100100;
                            4'h3:   ssd_driver_tmp_cc = 7'b0110000;
                            4'h4:   ssd_driver_tmp_cc = 7'b0011001;
                            4'h5:   ssd_driver_tmp_cc = 7'b0010010;
                            4'h6:   ssd_driver_tmp_cc = 7'b0000010;
                            4'h7:   ssd_driver_tmp_cc = 7'b1111000;
                            4'h8:   ssd_driver_tmp_cc = 7'b0000000;
                            4'h9:   ssd_driver_tmp_cc = 7'b0011000;
                            4'hA:   ssd_driver_tmp_cc = 7'b0001000;
                            4'hB:   ssd_driver_tmp_cc = 7'b0000011;
                            4'hC:   ssd_driver_tmp_cc = 7'b1000110; 
                            4'hD:   ssd_driver_tmp_cc = 7'b0100001;
                            4'hE:   ssd_driver_tmp_cc = 7'b0000110;
                            4'hF:   ssd_driver_tmp_cc = 7'b0001110;
                            default: ssd_driver_tmp_cc = 7'hZZZZ;
                        endcase
                        end
                end
            end
        assign ssd_driver_port_an = ssd_driver_tmp_an;
        assign ssd_driver_port_cc[6:0] = ssd_driver_tmp_cc[6:0];
        

        
endmodule
