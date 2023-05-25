module conditionCheck(input logic [3:0] cond , Flags, output logic condEx ); // N Z C V
always_comb
begin 
    
    casex(cond)
      //  EQ
      4'b0000: condEx = Flags[2];
      // NE
      4'b0001: condEx = ~ Flags[2];
      // CS/HS 
      4'b0010: condEx = Flags[1];
      // CC/LO 
      4'b0011: condEx = ~ Flags[1];
      //MI
      4'b0100: condEx = Flags[3];
      //PL
      4'b0101: condEx = ~ Flags[3];
      //VS
      4'b0110: condEx = Flags[0];
      // VC
      4'b0111: condEx = ~ Flags[0];
      //HI
      4'b1000: condEx = ~ Flags[2]& Flags[1];
      //LS
      4'b1001: condEx = Flags[2] | ~ Flags[1];
      //GE
      4'b1010: condEx = ~(Flags[3]^Flags[0]);
      //LT
      4'b1011: condEx = (Flags[3]^Flags[0]);
      //GT
      4'b1100: condEx = ~ Flags[2] & ~(Flags[3]^Flags[0]);
      //LE
      4'b1101: condEx = Flags[2]| (Flags[3]^Flags[0]);
      //AL
      4'b 1110: condEx = 1'b 1;
      //
      default: condEx = 1'b 0;
    endcase
end 
endmodule 
