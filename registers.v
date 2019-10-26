module register(RegWrite,RegSource,RegDest,RegSupport,WriteData,ReadData1,ReadData2,state);
    input RegWrite; // register write signal

    input [4:0] RegSource; // RS
    input [4:0] RegDest; // RT target
    input [4:0] RegSupport; // RD 
    input [31:0] WriteData; // data_in
    input [5:0] state; // for running at intended time

    reg [31:0] s0,s1,s2,s3,s4,s5,s6,s7; // registers
    reg [31:0] t0,t1,t2,t3,t4,t5,t6,t7; // registers

    output reg [31:0] ReadData1; // data_out
    output reg [31:0] ReadData2; // data_out
    
    
    always @(*) begin
        if (state == 6'b000010) begin
            
            // register r0 always contain 0
            if(RegSource == 5'b00000) begin 
                ReadData1 = 32'b0;
            end
            // RegSource
            else if(RegSource == 5'd8) begin
                ReadData1 = s0;
            end

            else if(RegSource == 5'd9) begin
                ReadData1 = s1;
            end

            else if(RegSource == 5'd10) begin
                ReadData1 = s2;
            end

            else if(RegSource == 5'd11) begin
                ReadData1 = s3;
            end

            else if(RegSource == 5'd12) begin
                ReadData1 = s4;
            end

            else if(RegSource == 5'd13) begin
                ReadData1 = s5;
            end

            else if(RegSource == 5'd14) begin
                ReadData1 = s6;
            end

            else if(RegSource == 5'd15) begin
                ReadData1 = s7;
            end

            else if(RegSource == 5'd16) begin
                ReadData1 = t0;
            end

            else if(RegSource == 5'd17) begin
                ReadData1 = t1;

            end

            else if(RegSource == 5'd18) begin
                ReadData1 = t2;
            end

            else if(RegSource == 5'd19) begin
                ReadData1 = t3;
            end

            else if(RegSource == 5'd20) begin
                ReadData1 = t4;
            end

            else if(RegSource == 5'd21) begin
                ReadData1 = t5;
            end

            else if(RegSource == 5'd22) begin
                ReadData1 = t6;
            end

            else if(RegSource == 5'd23) begin
                ReadData1 = t7;
            end

            else  begin
                ReadData1 = 32'hzzzzzzzz;
            end

                // RegSupport
            if(RegSupport == 5'd8) begin
                ReadData2 = s0;
            end

            else if(RegSupport == 5'd9) begin
                ReadData2 = s1;
            end

            else if(RegSupport == 5'd10) begin
                ReadData2 = s2;
            end

            else if(RegSupport == 5'd11) begin
                ReadData2 = s3;
            end

            else if(RegSupport == 5'd12) begin
                ReadData2 = s4;
            end

            else if(RegSupport == 5'd13) begin
                ReadData2 = s5;
            end

            else if(RegSupport == 5'd14) begin
                ReadData2 = s6;
            end

            else if(RegSupport == 5'd15) begin
                ReadData2 = s7;
            end

            else if(RegSupport == 5'd16) begin
                ReadData2 = t0;
            end

            else if(RegSupport == 5'd17) begin
                ReadData2 = t1;
            end

            else if(RegSupport == 5'd18) begin
                ReadData2 = t2;
            end

            else if(RegSupport == 5'd19) begin
                ReadData2 = t3;
            end

            else if(RegSupport == 5'd20) begin
                ReadData2 = t4;
            end

            else if(RegSupport == 5'd21) begin
                ReadData2 = t5;
            end

            else if(RegSupport == 5'd22) begin
                ReadData2 = t6;
            end

            else if(RegSupport == 5'd23) begin
                ReadData2 = t7;
            end

            else  begin
                ReadData2 = 32'hzzzzzzzz;
            end
  
        end


    end

    always @(*) begin
        // writeback state
        if (state == 6'b100000) begin
            
            if(RegWrite) begin

                // RegDestination
                if(RegDest == 5'd8) begin 
                    s0 = WriteData;
                end

                else if(RegDest == 5'd9) begin 
                    s1 = WriteData;
                end

                else if(RegDest == 5'd10) begin 
                    s2 = WriteData;
                end

                else if(RegDest == 5'd11) begin 
                    s3 = WriteData;
                end

                else if(RegDest == 5'd12) begin 
                    s4 = WriteData;
                end

                else if(RegDest == 5'd13) begin 
                    s5 = WriteData;
                end

                else if(RegDest == 5'd14) begin 
                    s6 = WriteData;
                end

                else if(RegDest == 5'd15) begin 
                    s7 = WriteData;
                end

                else if(RegDest == 5'd16) begin 
                    t0 = WriteData;
                end
                
                else if(RegDest == 5'd17) begin 
                    t1 = WriteData;
                end

                else if(RegDest == 5'd18) begin 
                    t2 = WriteData;
                end

                else if(RegDest == 5'd19) begin 
                    t3 = WriteData;
                end

                else if(RegDest == 5'd20) begin 
                    t4 = WriteData;
                end

                else if(RegDest == 5'd21) begin 
                    t5 = WriteData;
                end

                else if(RegDest == 5'd22) begin 
                    t6 = WriteData;
                end

                else if(RegDest == 5'd23) begin 
                    t7 = WriteData;
                end
            end
        end

    end


endmodule