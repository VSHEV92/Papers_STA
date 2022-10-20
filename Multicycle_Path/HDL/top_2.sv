module top_2 (
    input  logic        clk,
    input  logic        reset,
    output logic [31:0] q
);

    // строб-сигнал для счетчика
    logic counter_ce;

    // формирование строб сигнала
    always_ff @(posedge clk)
        if (reset)
            counter_ce <= 1'b0;
        else
            counter_ce <= ~counter_ce;    

    // счетчик
    always_ff @(posedge clk)
        if (reset)
            q <= '0;
        else if (counter_ce)   
            q <= q + 1'b1;    

endmodule