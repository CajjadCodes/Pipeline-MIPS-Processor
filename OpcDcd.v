module OpcDcd(Opc,inst,RT,addi,andi,lw,sw,j,beq,bne,nop);
input [5:0]Opc;
input [31:0]inst;
output RT;
output reg addi;
output reg andi;
output reg lw;
output reg sw;
output reg j;
output reg beq;
output reg bne;
output nop;
	always@(Opc)begin
		{addi,andi,lw,sw,j,beq,bne}=8'b0;
		case(Opc)
			6'b001000: addi=1'b1;
			6'b001100: andi=1'b1;
			6'b100011: lw=1'b1;
			6'b101011: sw=1'b1;
			6'b000010: j=1'b1;
			6'b000100: beq=1'b1;
			6'b000101: bne=1'b1;
		endcase
	end

	assign nop = ~(|inst);
	assign RT = (~nop) & (Opc == 6'b000000);

endmodule
