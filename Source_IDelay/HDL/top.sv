module top (
    input  logic ICLK,
    input  logic IDATA,
    output logic ODATA
);    
    
    always_ff@(posedge ICLK)
       ODATA <= IDATA;          

endmodule
