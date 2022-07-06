module top_3 (
    input  logic i_clk,
    input  logic i_data,
    output logic o_clk,
    output logic o_data
);

    always_ff @(posedge i_clk)
        o_data <= i_data;
        
    ODDR ODDR_reg (
        .C(i_clk),
        .D1(1'b0),
        .D2(1'b1),
        .Q(o_clk),
        .CE(1'b1),
        .R((1'b0),
        .S((1'b0)
    );
        
endmodule