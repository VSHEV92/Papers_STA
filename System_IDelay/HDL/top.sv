module top (
    input  logic CLK,
    input  logic IDATA,
    output logic ODATA
);    
    logic ff1, ff2;
    
    always_ff@(posedge CLK)
       ff1 <= ~IDATA;
       
    always_ff@(posedge CLK)
       ff2 <= ff1;
       
   assign ODATA = ~ff2;             
endmodule
