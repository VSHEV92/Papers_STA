module top_4 (
    input  logic clk_1,
    input  logic clk_2,
    input  logic i_data,
    output logic o_data
);
    logic cdc_data, sync_data;

    // передающий тактовый домен
    always_ff @(posedge clk_1)
        cdc_data <= i_data;

    // XPM синхронизатор
    xpm_cdc_single #(
        .DEST_SYNC_FF(2),   
        .INIT_SYNC_FF(0), 
        .SIM_ASSERT_CHK(0),
        .SRC_INPUT_REG(0)
    )
    xpm_synchronizer (
        .src_clk(clk_1),
        .src_in(cdc_data),
        .dest_clk(clk_2),
        .dest_out(sync_data)
    );

    // принимающий тактовый домен
    always_ff @(posedge clk_2)
        o_data <= sync_data;

endmodule