module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum 
);
    
    genvar i;

    wire [99:0] w_cout;
    
    generate 
        bcd_fadd BCD1 (a[3:0], b[3:0], cin, w_cout[0], sum[3:0]);
        for (i = 4; i < 400; i = i + 4) begin : BCD_BLOCK
            bcd_fadd BCD (a[i+3:i], b[i+3:i], w_cout[i/4-1], w_cout[i/4], sum[i+3:i]);
        end
    endgenerate
    
    assign cout = w_cout[99];
    
endmodule
