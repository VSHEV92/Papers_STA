module top (
    input  logic i_clk,
    input  logic i_data,
    output logic o_data
);

    logic clk_1, clk_2;
    logic data_clk_1, data_clk_2;

    // PLL для формирования синхронных сигналов
    clk_wiz_0 PLL (
        .i_clk(i_clk),
        .clk_1(clk_1),
        .clk_2(clk_2)
    );
    
    // передающий домен
    always_ff @(posedge clk_1) begin
        data_clk_1 <= i_data;
    end

    // приемный домен
    always_ff @(posedge clk_2) begin
        data_clk_2 <= data_clk_1;
        o_data <= data_clk_2;
    end

    
endmodule