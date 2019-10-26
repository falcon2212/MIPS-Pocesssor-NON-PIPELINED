`include "./pc.v"
`include "./instructionmemory.v"

module fetch(PC_enable,reset,PCIN,PCOUT,PC_next,instruction,state);
	input PC_enable; // disable pc for software hardcoding
	input reset; // reset PC
	input [31:0] PCIN; // PCinput after PC+1 as well as branch 
	input [5:0] state; // for running at intended time
	// input hardcode; // wrting or reading
	// input [31:0] // WriteInstruction;
	
	
	output [31:0] PCOUT;
	output reg [31:0] PC_next;
	output [31:0] instruction;

	// reg IW,IR;
	// for writing into instruction memory
	// always @ (*) begin
	// 	if(hardcode) begin
	// 		IW = 1;
	// 		IR = 1'bz;
	// 	end
	// 	else begin
	// 		IR = 1;
	// 		IW = 1'bz;
	// 	end
	// end


	ProgramCounter pc(PC_enable,reset,PCIN,PCOUT,state);
	instructionmemory im(PCOUT,instruction,state);
	
	// pc update
	always@(*) begin
		if (state == 6'b000001) begin
			PC_next = PCOUT+1;
		end
	end

endmodule
