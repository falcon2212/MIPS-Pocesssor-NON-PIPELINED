module instructionmemory(InstrAddr,ReadInstruction,state);
	input [31:0] InstrAddr; // address from pc
    input [5:0] state; // for running at intended time

    output reg [31:0] ReadInstruction; // instruction
	reg [31:0] memory [0:134]; // memory

    // instruction is 32 bits
    always @(*) begin
        if(state == 6'b000010) begin
            ReadInstruction = memory[InstrAddr];
        end

    end


endmodule
