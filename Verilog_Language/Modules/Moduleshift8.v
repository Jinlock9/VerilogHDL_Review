module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] dq1, dq2, qm;
    
    my_dff8 dff1 (clk, d, dq1);
    my_dff8 dff2 (clk, dq1, dq2);
    my_dff8 dff3 (clk, dq2, qm);
    
    always @(*) begin // 4 to 1 MUX
        if (sel == 2'b00) begin
            q = d;
        end
        else if (sel == 2'b01) begin
            q = dq1;
        end
        else if (sel == 2'b10) begin
            q = dq2;
        end
        else begin
            q = qm;
        end
    end
    
endmodule

// OR 

module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

	wire [7:0] o1, o2, o3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
	my_dff8 d1 ( clk, d, o1 );
	my_dff8 d2 ( clk, o1, o2 );
	my_dff8 d3 ( clk, o2, o3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase

endmodule