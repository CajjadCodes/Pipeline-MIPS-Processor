module Mux4to1_32bit(inp0, inp1, inp2, inp3, sel, out);
input [31:0] inp0;
input [31:0] inp1;
input [31:0] inp2;
input [31:0] inp3;
input [1:0] sel;
output [31:0] out;

	assign out = (sel == 2'b00)? inp0:
			(sel == 2'b01)? inp1:
			(sel == 2'b10)? inp2:
			(sel == 2'b11)? inp3:
			32'bz;
	
endmodule
