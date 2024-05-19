module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cout;
    wire [15:0] temp1, temp2;
    
    add16 add1 (a[15:0], b[15:0], 0, sum[15:0], cout);
    add16 add2 (a[31:16], b[31:16], 0, temp1);
    add16 add3 (a[31:16], b[31:16], 1, temp2);
    
    always @(*)	// 2-to-1 MUX
        case(cout)
            1'b0: sum[31:16] = temp1;
            1'b1: sum[31:16] = temp2;
		endcase

endmodule