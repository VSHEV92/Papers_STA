module top_2 (
    input  logic ICLK,
    input  logic IDATA,
    output logic ODATA
);    
    
    logic clk_mmcm; 
    
    mmcm mmc_instance_name
    (
        .clk_in1(ICLK),
        .clk_out1(clk_mmcm)
    ); 
    
    always_ff@(posedge clk_mmcm)
        ODATA <= IDATA;          

endmodule
