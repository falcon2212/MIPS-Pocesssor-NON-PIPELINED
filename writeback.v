module writeback(Readdata,AluResult,MemtoReg,writedata,state);

input [31:0] Readdata; // data read from memory
input [31:0] AluResult; // result from alu directly
input MemtoReg; // control for choosing between memory data and alu result
input [5:0] state;  // for running at intended time

output reg [31:0] writedata; // data to be sent back to registers

always@(*) begin

		if (state == 6'b100000) begin
				if(MemtoReg) begin 
						// memory write
						writedata = Readdata;
				end
			
				else begin
						// alu write
						writedata = AluResult;
				end
		end
		
end

endmodule