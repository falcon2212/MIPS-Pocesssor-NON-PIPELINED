// `include "./execute.v"
module ALUControl(ALUop,Function,ALUcontrol,state);
    input [1:0] ALUop; // op from controlunit
    input [5:0] Function; // from instruction
    input [5:0] state; // for running at intended time

    output reg [3:0] ALUcontrol;

    always @(*) begin
        // store/load
        if (state == 6'b000100) begin
            
            if(ALUop == 2'b00) begin
                ALUcontrol = 4'b0010;
            end
            // beq
            else if(ALUop == 2'b01) begin
                // sub
                ALUcontrol = 4'b0011;
            end

            else if(ALUop == 2'b10) begin
                // add
                if(Function == 6'b100000) begin
                    ALUcontrol = 4'b0010;
                end
                // sub
                else if(Function == 6'b100010) begin
                    ALUcontrol = 4'b0011;
                end
                // and
                else if(Function == 6'b100100) begin
                    ALUcontrol = 4'b0000;
                end
                // or
                else if(Function == 6'b100101) begin
                    ALUcontrol = 4'b0001;
                end
                // mul
                else if(Function == 6'b111111) begin
                    ALUcontrol = 4'b1000;
                end

                else begin
                    ALUcontrol = 4'bzzzz;
                end
            end

            else begin
                    ALUcontrol = 4'bzzzz;
                end
        end

    end


endmodule

module ALUMain(data1,data2,ALUcontrol,dataout,state);
    input [31:0] data1; // operand1
    input [31:0] data2; // operand2
    input [3:0] ALUcontrol; // control input
    input [5:0] state; // for running at intended time
    output reg [31:0] dataout; // alu result

    always @(*) begin
        if (state == 6'b001000) begin
            
            if(ALUcontrol == 4'b0000) begin
                dataout = data1 & data2;
            end

            else if(ALUcontrol == 4'b0001) begin
                dataout = data1 | data2;
            end

            else if(ALUcontrol == 4'b0010) begin
                dataout = data1 + data2;
            end

            else if(ALUcontrol == 4'b0011) begin
                dataout = data1 - data2;
            end

            else if(ALUcontrol == 4'b1000) begin
                dataout = data1 * data2;
            end

            else begin
                dataout = 32'hzzzzzzzz;
            end
        end

    end

endmodule

module ALUModule(data1,data2,ALUop,Function,dataout,state);
    input [31:0] data1; // operand1
    input [31:0] data2; // operand2
    input [1:0] ALUop; // op from control unit
    input [5:0] Function; // from instruction
    input [5:0] state; // for running at intended time
    wire [3:0] ALUcontrol; // contol signal from aluop to alu 
    output [31:0] dataout; // alu results

    ALUControl ac1(ALUop,Function,ALUcontrol,state);
    ALUMain am1(data1,data2,ALUcontrol,dataout,state);

endmodule

