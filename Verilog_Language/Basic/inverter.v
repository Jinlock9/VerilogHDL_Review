module top_module (
    input in,
    output out
);

    assign out = ~in; 
    // assign out = !in;
    // ~: bit-wise, !: logical

endmodule