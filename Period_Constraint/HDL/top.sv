module top (
    input logic clk,
    //input logic clk2,
    input logic in1,
    output logic out1
);
    logic ff1, ff2;
    
    always_ff @(posedge clk)
        ff1 <= in1;
     
    always_ff @(posedge clk)
        ff2 <= ~ff1;

    assign out1 = ff2;
     
endmodule