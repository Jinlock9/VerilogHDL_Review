module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y 
);
    
    wire w1, w2, w3, w4, w5, w6;
    
	assign w1 = p1a & p1b & p1c;
    assign w2 = p1d & p1e & p1f;
    assign w3 = w1 | w2;
    assign p1y = w3;
    
    assign w4 = p2a & p2b;
    assign w5 = p2c & p2d;
    assign w6 = w4 | w5;
    assign p2y = w6;

endmodule