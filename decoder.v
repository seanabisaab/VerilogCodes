`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 12:44:38 PM
// Design Name: 
// Module Name: decoder
// Project Name: 4x16 Decoder
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


module decoder(
    input [3:0] in,
    output [15:0] out
    );
    wire in0,in1,in2,in3;
    not (in0, in[0]);
    not (in1, in[1]);
    not (in2, in[2]);
    not (in3, in[3]);
    
    and(out[0], in3, in2, in1, in0);
    and(out[1], in3, in2, in1, in[0]);
    and(out[2], in3, in2, in[1], in0);
    and(out[3], in3, in2, in[1], in[0]);
    and(out[4], in3, in[2], in1, in0);
    and(out[5], in3, in[2], in1, in[0]);
    and(out[6], in3, in[2], in[1], in0);
    and(out[7], in3, in[2], in[1], in[0]);
    and(out[8], in[3], in2, in1, in0);
    and(out[9], in[3], in2, in1, in[0]);
    and(out[10], in[3], in2, in[1], in0);
    and(out[11], in[3], in2, in[1], in[0]);
    and(out[12], in[3], in[2], in1, in0);
    and(out[13], in[3], in[2], in1, in[0]);
    and(out[14], in[3], in[2], in[1], in0);
    and(out[15], in[3], in[2], in[1], in[0]);
    
endmodule
    
    //assign out[0] = (in == 4'b0000 && enable) ? 1'b1 : 1'b0;
    //assign out[1] = (in == 4'b0001 && enable) ? 1'b1 : 1'b0;
    //assign out[2] = (in == 4'b0010 && enable) ? 1'b1 : 1'b0;
    //assign out[3] = (in == 4'b0011 && enable) ? 1'b1 : 1'b0;
    //assign out[4] = (in == 4'b0100 && enable) ? 1'b1 : 1'b0;
    //assign out[5] = (in == 4'b0101 && enable) ? 1'b1 : 1'b0;
    ///assign out[6] = (in == 4'b0110 && enable) ? 1'b1 : 1'b0;
    //assign out[7] = (in == 4'b0111 && enable) ? 1'b1 : 1'b0;
    //assign out[8] = (in == 4'b1000 && enable) ? 1'b1 : 1'b0;
    //assign out[9] = (in == 4'b1001 && enable) ? 1'b1 : 1'b0;
    //assign out[10] = (in == 4'b1010 && enable) ? 1'b1 : 1'b0;
    //assign out[11] = (in == 4'b1011 && enable) ? 1'b1 : 1'b0;
    //assign out[12] = (in == 4'b1100 && enable) ? 1'b1 : 1'b0;
    //assign out[13] = (in == 4'b1101 && enable) ? 1'b1 : 1'b0;
    //assign out[14] = (in == 4'b1110 && enable) ? 1'b1 : 1'b0;
    //assign out[15] = (in == 4'b1111 && enable) ? 1'b1 : 1'b0;
