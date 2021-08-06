module top (
    input  logic clk_pin,
    input  logic in,
    output logic out
);
    logic ff1, ff2;
    
    always_ff @(posedge clk_pin)
        ff1 <= in;
     
    always_ff @(posedge clk_pin)
        ff2 <= ~ff1;

    assign out = ff2;
     
endmodule