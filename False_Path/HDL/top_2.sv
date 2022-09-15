module top_2 (
    input  logic i_clk,
    input  logic i_data,
    output logic o_data
);
    logic clk_1;
    logic clk_2;
    logic cdc_data;

    clk_wiz_0 pll
    (
        .i_clk (i_clk),
        .clk_1 (clk_1),
        .clk_2 (clk_2)
    );

    // передающий тактовый домен
    always_ff @(posedge clk_1)
        cdc_data <= i_data;

    // принимающий тактовый домен
    always_ff @(posedge clk_2)
        o_data <= cdc_data;

endmodule