module datamemory(CLK,WriteData,Addr,DR,DW,ReadData,state);
    input CLK;
	input [31:0] WriteData; // data to memeory
	input [31:0] Addr; // address input
	input DR; // read control
    input DW; // write control
    input [5:0] state; // for running at intended time

    output reg [31:0] ReadData; // data from memory

	reg [7:0] memory [0:183]; // creating memory


	always @(posedge CLK) begin
        if (state == 6'b001000) begin
            
            // read from data
            if(DR) begin
                // $display("add of mem %d data  %d ",Addr +3,memory[Addr+3]);
                ReadData[31:24] = memory[Addr];
                ReadData[23:16] = memory[Addr+1];
                ReadData[15:8] = memory[Addr+2];
                ReadData[7:0] = memory[Addr+3];
            end

            // write to data
            if(DW) begin
                memory[Addr] = WriteData[31:24];
                memory[Addr + 1] = WriteData[23:16];
                memory[Addr + 2] = WriteData[15:8];
                memory[Addr + 3] = WriteData[7:0];

                ReadData = 32'hzz;
            end
    
        end
        

    end


endmodule
