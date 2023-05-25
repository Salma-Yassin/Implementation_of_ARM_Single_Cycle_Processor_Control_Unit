module SC_controll( input logic CLK, reset, input logic [3:0] Cond, input logic [1:0] op , input logic [5:0] funct , input logic [3:0] Rd, input logic [3:0] ALUFlags,
output logic PCSrc , MemtoReg , MemWrite , output logic [1:0]ALUControl, output logic ALUSrc, output logic [1:0] ImmSrc ,RegSrc, output logic RegWrite );

//module decoder (input logic [1:0] op, input logic [5:0] funct, input logic [3:0] Rd,
//output logic [1:0] FlagW, output logic PCS , RegW , MemW ,output logic MemtoReg, ALUSrc, output logic [1:0] ImmSrc ,RegSrc ,ALUControl);
logic [1:0] FlagW;

decoder decoder_1 (op, funct, Rd, FlagW, PCS , RegW , MemW ,MemtoReg, ALUSrc, ImmSrc ,RegSrc ,ALUControl, NoWrite);



//module condLogic(input logic CLK, reset, input logic PCS, RegW , MemW, input logic [1:0] FlagW , input logic [3:0] ALUFlags , Cond,
//output logic PCSrc , RegWrite , MemWrite);

condLogic logic_1(CLK, reset,PCS, RegW , MemW, NoWrite, FlagW , ALUFlags , Cond, PCSrc , RegWrite , MemWrite);

endmodule 
