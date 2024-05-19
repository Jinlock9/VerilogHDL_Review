`default_nettype none
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   
); 
    
    wire or_in1;
    wire or_in2;
    wire out_in;
    
    assign or_in1 = a & b;
    assign or_in2 = c & d;
    assign out_in = or_in1 | or_in2;
    assign out = out_in;
    assign out_n = ~out_in;
    
endmodule

// OR 

module top_module (
	input a,
	input b,
	input c,
	input d,
	output out,
	output out_n );
	
	wire w1, w2;		// Declare two wires (named w1 and w2)
	assign w1 = a&b;	// First AND gate
	assign w2 = c&d;	// Second AND gate
	assign out = w1|w2;	// OR gate: Feeds both 'out' and the NOT gate

	assign out_n = ~out;	// NOT gate
	
endmodule
