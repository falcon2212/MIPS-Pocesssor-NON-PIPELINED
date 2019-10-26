`include "./datamemory.v"
module mem_access(CLK,WriteData,Addr,DR,DW,ReadData,Zero,branch,PC_new,PC_beq,PC_next,state);
	input CLK;
	input [31:0] WriteData; // data to be written 
	input [31:0] Addr; // address from aluresult
	input [31:0] PC_beq; // pc value selection from pc+1 and pcbranch
	input DR; // data read signal
    input DW; // data write signal
    input Zero; // zero flag if 0 the branch
    input branch; // branch control signal from control unit
     
	input [31:0] PC_next; // pc + 1
	input [5:0] state; // for controling the execution

    output [31:0] ReadData; // data from memory
	output reg [31:0] PC_new; // new pc value

	reg [7:0] memory [31:0]; // memory


    datamemory dm(CLK,WriteData,Addr,DR,DW,ReadData,state);
   
    always @(*) begin
		if (state == 6'b010000) begin
			// branch or not
			if(branch&&!Zero)
				begin
				PC_new = PC_beq;
				end
			else
				begin
				PC_new = PC_next;
				end
		end

    end

endmodule
