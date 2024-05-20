module top_module( 
    input [254:0] in,
    output [7:0] out 
);
    
    always @(*) begin
        out = 8'b0;
        for (int i = 0; i < $bits(in); i++) begin
            if (in[i] == 1'b1) begin
                out = out + 8'b1;
            end
        end
    end

endmodule

// OR

module top_module (
	input [254:0] in,
	output reg [7:0] out
);

	always @(*) begin	// Combinational always block
		out = 0;
		for (int i=0;i<255;i++)
			out = out + in[i];
	end
	
endmodule
