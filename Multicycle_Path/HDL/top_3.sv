module top_3 (
    input  logic i_clk,
    input  logic i_data,
    output logic o_clk,
    output logic o_data
);

    always_ff @(posedge i_clk)
        o_data <= i_data;
        
    assign o_clk = i_clk;
        
endmodule