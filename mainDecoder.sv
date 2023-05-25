module mainDecoder(input logic [1:0] op, input logic [5:0] funct , output logic [9:0] controls);

always_comb

    casex(op)
     // Data-processing immediate 
     2'b00: if (funct[5]) controls = 10'b0000101001;
     // Data-processing register
     else  controls = 10'b 0000001001;
     // LDR
     2'b01: if(funct[0]) controls = 10'b 0001111000;
     //STR 
     else controls = 10'b1001110100;
     //B 
     2'b10: controls = 10'b0110100010;
     // unimplemented
     default: controls = 10'bx;   
    endcase

endmodule 
