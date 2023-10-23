module ClkDivider (
    input ClkDivider_clk,
    input ClkDivider_rst,
    output reg ClkDivider_div
    );
    localparam constantNumber = 50000000;

    reg [31:0] count;
 
always @ (posedge(ClkDivider_clk), posedge(ClkDivider_rst))
begin
    if (ClkDivider_rst == 1'b1)
        count <= 32'b0;
    else if (count == constantNumber - 1)
        count <= 32'b0;
    else
        count <= count + 1;
end

always @ (posedge(ClkDivider_clk), posedge(ClkDivider_rst))
begin
    if (ClkDivider_rst == 1'b1)
        ClkDivider_div <= 1'b0;
    else if (count == constantNumber - 1)
        ClkDivider_div <= ~ClkDivider_div;
    else
        ClkDivider_div <= ClkDivider_div;
end
 
endmodule
