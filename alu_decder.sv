module aludecoder (input logic ALUOP, input logic [5:0]funct , output logic [1:0] ALUControl,FlagW, output logic NoWrite); // should we enter only [4:0] funct

always_comb // do we need it ?????????????????????
begin
 NoWrite = 0;

if(ALUOP) begin // in case of data processing instruction 
case(funct[4:1])
4'b0100: ALUControl = 2'b00; //ADD
4'b0010: ALUControl = 2'b01; //SUB
4'b0000: ALUControl = 2'b10; //AND 
4'b1100: ALUControl = 2'b11; // ORR
4'b1010: ALUControl = 2'b01; // CMP ---> do subtract and set the flags.
default: ALUControl = 2'bx; //NOT supported 
endcase
// update flags 

if (funct[4:1] == 4'b1010) 
begin
FlagW = 2'b11;// if CMP ---> always save the flags 
NoWrite = 1;
end 
else begin
FlagW[1] = funct[0];
FlagW[0] = funct[0] & ( ALUControl == 2'b00 | ALUControl ==  2'b01 );
end 
end 

else // in case of non-data processing instruction 

begin
ALUControl = 2'b00;
FlagW = 2'b00;
end 
end 
endmodule 
