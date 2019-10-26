`include "./alu.v"
module execute(data1,data2,sign_extended,PC_next, // all input ports
    ALUop,ALUSrc,   // all control signals
    zero,alu_result,PC_branch // all output ports
    ,state //state 
    );
    input [31:0] data1; // regdata1
    input [31:0] data2; // regdata2
    input [31:0] sign_extended; // sign extended
    input [1:0] ALUop; // alu control
    input ALUSrc; // selection between regdata2 and sign extended instruction
    input [31:0] PC_next; // pc+1 as input  
    input [5:0] state; // for running at intended time

    wire [3:0] ALUcontrol; // alu constrol
    reg [31:0] operand1,operand2; 
    reg [5:0] Function; // function for alu control

    output  zero; // zero flag
    output [31:0] alu_result; // alu result
    output reg [31:0] PC_branch; // instruction*4 + pc

    always @(*) begin
        if (state == 6'b000100) begin
            // branch update
            PC_branch = sign_extended*4+PC_next;

            Function = sign_extended[5:0];
            operand1 = data1;

            // operand2 selection 
            if(ALUSrc) begin
                operand2 = sign_extended;
            end
            else begin
                operand2 = data2;
            end
    
        end
    end


    ALUModule am1(operand1,operand2,ALUop,Function,alu_result,state);
    assign  zero = operand1 - operand2;


endmodule