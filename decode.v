`include "./registers.v"
`include "./controlunit.v"

module decode(Instruction,WriteData,// inputs
    RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,ALUOp, // output control lines
    Data1,Data2,SignExtended //outputs
    ,state
    );
    input [31:0] Instruction; // instruction from fetch
    input [31:0] WriteData; // data from writeback
    input [5:0] state; // for running at intended time

    output reg [31:0] Data1; // operand1
    output reg [31:0] Data2; // operand2
    output reg [31:0] SignExtended; // signextended


    output RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite; // control signals
    output [1:0] ALUOp; // alu control
    
    wire [31:0] ReadData1,ReadData2; // operand1 operand2
 
    reg [4:0] RegDest,RegSupport; // rd,rt 

    controlunit C1(Instruction[31:26],RegDst,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,ALUOp,state);
    register R1(RegWrite,Instruction[25:21],RegDest,RegSupport,WriteData,ReadData1,ReadData2,state);
  
  // rd,rt needs to be swapped for beq instruction as well as stores
  always @(*) begin
        if (state == 6'b000010 ) begin
            if(Instruction[31:26] == 6'b100000 || Instruction [31:26] == 6'b011101) begin // beq instruction
                RegDest = Instruction[15:11];
                RegSupport = Instruction[20:16];
            end

            else begin
                RegDest = Instruction[20:16];
                RegSupport = Instruction[15:11];

            end
        end
    end


    always @(*) begin
        if (state == 6'b000010) begin
            
            Data1 = ReadData1;
            Data2 = ReadData2;

            SignExtended = Instruction[15:0]; 
        end
    end


    

endmodule