module pc_logic(input logic [3:0] Rd, input logic Branch, RegW, output logic PCS );

assign PCS = ((Rd == 4'b1111)& RegW)| Branch ; // should we use assign ?!

endmodule 