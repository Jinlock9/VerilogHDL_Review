module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [15:0] b1, b2;
    wire cout;
    
    assign b1 = b[15:0] ^ {16{sub}};
    assign b2 = b[31:16] ^ {16{sub}};
    
    add16 add1 (a[15:0], b1, sub, sum[15:0], cout);
    add16 add2 (a[31:16], b2, cout, sum[31:16]);

endmodule