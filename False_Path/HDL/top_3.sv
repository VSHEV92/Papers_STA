module top_3 (
    input  logic clk_1,
    input  logic clk_2,
    input  logic i_data,
    output logic o_data
);
    logic cdc_data, sync_data;

    // передающий тактовый домен
    always_ff @(posedge clk_1)
        cdc_data <= i_data;

    // принимающий тактовый домен
    always_ff @(posedge clk_2) begin
        sync_data <= cdc_data;
        o_data <= sync_data;
    end    

endmodule