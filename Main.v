`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "mem_access.v"
`include "writeback.v"
module main(
	CLK	,reset
		);
	input CLK;
	input reset; // reset control


	reg [5:0] state = 6'b000001; // shift counter for state


	wire PC_enable,RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,Zero; // controls
	wire [1:0] ALUop; // alu control

	
	wire [31:0] PCIN; // PCnext for next instruction
	wire [31:0] PCOUT; // PC
	wire [31:0] PC_next; // Pc + 1 as well as branch update
	wire [31:0] instruction;
	wire [31:0] WriteData; // for reg writeback
	wire [31:0] Data1,Data2,SignExtended; // input for alu
	wire [31:0] AluResult,PCBranch; // results from alu for memaccess or reg writeback
	wire [31:0] ReadData; // data from mem access
	assign  PC_enable = 1; // no software hardcoding

	fetch f (PC_enable,reset,PCIN,PCOUT,PC_next,instruction,state);

	decode d(instruction,WriteData,RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,ALUop,
		Data1,Data2,SignExtended,state);

	execute e(Data1,Data2,SignExtended,PC_next,ALUop,ALUSrc,Zero,AluResult,
		PCBranch,state);

	mem_access m (CLK,Data2,AluResult,MemRead,MemWrite,ReadData,
		Zero,Branch,PCIN,PCBranch,PC_next,state);
	
	writeback w (ReadData,AluResult,MemToReg,WriteData,state);


	always @(negedge CLK)
    begin
		// update the counter
        state = {state[4:0],state[5]};


        
        


    end

	always @(posedge CLK) begin
		//final result in the matric multiplication
		if(state == 6'b100000) begin
			$display("matrix 1");
			$display(" %d %d %d",m.dm.memory[3],m.dm.memory[7],m.dm.memory[11]);
			$display(" %d %d %d",m.dm.memory[15],m.dm.memory[19],m.dm.memory[23]);
			$display(" %d %d %d",m.dm.memory[27],m.dm.memory[31],m.dm.memory[35]);

			$display("matrix 2");
			$display(" %d  %d %d",m.dm.memory[3],m.dm.memory[7],m.dm.memory[11]);
			$display(" %d  %d %d",m.dm.memory[15],m.dm.memory[19],m.dm.memory[23]);
			$display(" %d  %d %d",m.dm.memory[27],m.dm.memory[31],m.dm.memory[35]);
		
			$display("matrix result");
			$display(" %d  %d %d",m.dm.memory[131],m.dm.memory[135],m.dm.memory[139]);
			$display(" %d  %d %d",m.dm.memory[143],m.dm.memory[147],m.dm.memory[151]);
			$display(" %d  %d %d",m.dm.memory[155],m.dm.memory[159],m.dm.memory[163]);
		end
	end

endmodule