module ProgramCounter(PC_enable,reset,PCIN,PCOUT,state);
	input PC_enable; // pc disable for software hardcode
	input reset; // reset pc to 0
	input [31:0] PCIN; // new pc value after instruction end
    input [5:0] state; // for running at intended time 

	output reg [31:0] PCOUT; // pc value to fetch instruction


	always @(*) begin
        if (state == 6'b000001) begin
            if(PC_enable && !reset) begin
                PCOUT = PCIN;
            end

            else if(reset) begin
                PCOUT = 31'h00000000;
            end

            else begin
                PCOUT = 32'hzzzzzzzz;
            end

        end

	end

endmodule
