module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    
    fadder FA1(a[0], b[0], cin, sum[0], cout[0]);
    
    //this is a generte block
    //The loop generate construct provides an easy and concise method to create multiple instances 
    //of module items such as module instances, assign statements, assertions, interface instances 
    //In essence generate block is a special type of for loop with the loop index variable of datatype genvar.
    generate
        for (i=1; i<100; i=i+1) begin : Full_adder_block
            fadder FA(a[i], b[i], cout[i-1], sum[i], cout[i]);
        end
    endgenerate
endmodule

module fadder (
    input a,b,cin,
    output sum,carry
);

	assign sum = a ^ b ^ cin;
	assign carry = (a & b) | (b & cin)  | (cin & a) ;

endmodule