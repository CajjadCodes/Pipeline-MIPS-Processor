module RegisterFile (clk, rst, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
input clk;
input rst;
input RegWrite;
input [4:0] ReadReg1;
input [4:0] ReadReg2;
input [4:0] WriteReg;
input [31:0] WriteData;
output [31:0] ReadData1;
output [31:0] ReadData2;

	reg [31:0] Register [0:31];
	
	assign ReadData1 = ~clk? Register[ReadReg1]: 32'bz;
	assign ReadData2 = ~clk? Register[ReadReg2]: 32'bz;

	integer i;
	always @(posedge rst) begin
		if (rst) begin 
			for (i = 0; i < 32; i = i+1)
				Register[i] <= 0;
		end
	end

	always @(clk or WriteReg or WriteData or RegWrite) begin
		if (clk & RegWrite)
			if (WriteReg != 5'b0)
				Register[WriteReg] <= WriteData;
	end
endmodule