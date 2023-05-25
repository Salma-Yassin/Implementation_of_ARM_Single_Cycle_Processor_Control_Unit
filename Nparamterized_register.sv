module NparamReg #(parameter Width = 2)(input logic clk, reset , en, input logic [ Width - 1:0] d, 
output logic [ Width - 1:0] q );//Resetable Enabled Register 

//asynchronouse reset 
always_ff@(posedge clk,posedge reset )
if (reset) q <= 0; // rest the registers 
else if (en) q <= d;  // store 

endmodule 
