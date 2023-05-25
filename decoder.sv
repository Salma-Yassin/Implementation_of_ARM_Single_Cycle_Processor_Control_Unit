module decoder (input logic [1:0] op, input logic [5:0] funct, input logic [3:0] Rd,
output logic [1:0] FlagW, output logic PCS , RegW , MemW ,output logic MemtoReg, ALUSrc, output logic [1:0] ImmSrc ,RegSrc ,ALUControl , output logic NoWrite);


// module mainDecoder(input logic [1:0] op, input logic [5:0] funct , output logic [9:0] controls);
logic [9:0]controls; 
logic Branch , ALUOP ;
mainDecoder maindecoder(op ,funct ,controls);
assign {RegSrc , ImmSrc , ALUSrc , MemtoReg , RegW , MemW , Branch , ALUOP} = controls;

// module pc_logic(input logic [3:0] Rd, input logic Branch, RegW, output logic PCS );
pc_logic pcLogic(Rd ,Branch ,RegW ,PCS);

// module aludecoder (input logic ALUOP, input logic [5:0]funct , output logic [1:0] ALUControl,FlagW );

aludecoder ALUdecoder(ALUOP ,funct ,ALUControl ,FlagW, NoWrite);

endmodule