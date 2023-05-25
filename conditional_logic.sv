module condLogic(input logic CLK, reset, input logic PCS, RegW , MemW, NoWrite, input logic [1:0] FlagW , input logic [3:0] ALUFlags , Cond,
output logic PCSrc , RegWrite , MemWrite);

//Read Flags stored in the paramaterized Registers
//module NparamReg #(parameter Width = 2)(input logic clk, reset , en, input logic [ Width - 1:0] d, 
//output logic [ Width - 1:0] q );//Resetable Enabled Register 
logic [3:0]Flags;
logic [1:0] FlagWrite;

NparamReg reg_1(CLK , reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]); //---------> N,Z 
NparamReg reg_2(CLK , reset, FlagWrite[0], ALUFlags[1:0],Flags[1:0]);//---------> C,V

//module conditionCheck(input logic [3:0] cond , Flags, output logic condEx )
conditionCheck Block_1(Cond, Flags , condEx );

assign PCSrc = PCS & condEx;
assign RegWrite = RegW & condEx& ~ NoWrite;
assign MemWrite = MemW & condEx;

// Write Flags in the parametrize register 
always_comb
begin 
FlagWrite[0] = FlagW[0] & condEx; // need the change to be reflected on the above registers 
FlagWrite[1] = FlagW[1] & condEx;
end 
endmodule 
