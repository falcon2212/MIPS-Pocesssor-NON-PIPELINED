module controlunit(opcode,RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,ALUOp,state);

    input [5:0] opcode; // from instruction
    output reg RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite; // control signals
    output reg [1:0] ALUOp; // alu contol
    input [5:0] state;// for running at intended time

    always @ (*) begin 
		if (state == 6'b000010) begin
		
	        // Rformat 00 in octal
	        if(opcode == 6'b000000) begin
	            RegDst = 1'b1;
	            ALUSrc = 1'b0;
	            MemToReg = 1'b0;
	            RegWrite = 1'b1;
	            MemRead = 1'b0;
	            MemWrite = 1'b0;
	            Branch = 1'b0;
	            ALUOp = 2'b10; 
	        end
	        // Load 34 in octal
	        if(opcode == 6'b011100) begin
	            RegDst = 1'b0;
	            ALUSrc = 1'b1;
	            MemToReg = 1'b1;
	            RegWrite = 1'b1;
	            MemRead = 1'b1;
	            MemWrite = 1'b0;
	            Branch = 1'b0;
	            ALUOp = 2'b00;
	        end
	        // store 35 in octal
	        if(opcode == 6'b011101) begin
				RegDst = 1'b0;
	            ALUSrc = 1'b1;
				MemToReg = 1'b0;
	            RegWrite = 1'b0;
	            MemRead = 1'b0;
	            MemWrite = 1'b1;
	            Branch = 1'b0;
	            ALUOp = 2'b00;
	        end
	        // beq 40 in octal
	        if(opcode == 6'b100000) begin
				RegDst = 1'b0;
	            ALUSrc = 1'b0;
				MemToReg = 1'b0;
	            RegWrite = 1'b0;
				MemRead = 1'b0;
	            MemWrite = 1'b0;
	            Branch = 1'b1;
	            ALUOp = 2'b01;          
	        end
		end


    end

endmodule