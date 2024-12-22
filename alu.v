module ALU(input [3:0] A,B, input [2:0] OP,output reg [3:0] alu_out);
always @(*)
begin
  case(OP)
    3'b000 : alu_out = 0;
     3'b001 : alu_out = A+B;
      3'b010 : alu_out = A-B;
       3'b011 : alu_out = A & B;
        3'b100 : alu_out = A | B;
         3'b101 : alu_out = ~A;
          3'b110 : alu_out = ~B;
           3'b111 : alu_out = 0;
           default : alu_out = 0;
       endcase
     end      
endmodule

module TB();
reg[3:0] A,B;
reg[2:0]OP;
wire[3:0]alu_out;
ALU a(A,B,OP,alu_out);
initial 
begin
  OP = 3'b000;A=4'b0011;B=4'b0001;
  #10;
   OP = 3'b001;A=4'b0011;B=4'b0001;
  #10;
   OP = 3'b010;A=4'b0011;B=4'b0001;
  #10;
   OP = 3'b011;A=4'b0011;B=4'b0001;
  #10;
end
endmodule
------------------
module ALU(input [3:0] A,B,OP,output reg [3:0] alu_out);
always @(*)
begin
  case(OP)
    4'b0000 : alu_out = 0; // zero output
    4'b0001 : alu_out = A+B; // add
    4'b0010 : alu_out = A-B; // subtract
    4'b0011 : alu_out = A & B; // and
    4'b0100 : alu_out = A | B; // or
    4'b0101 : alu_out = ~A; // not A
    4'b0110 : alu_out = ~|A; // NOR all bits in vector A together
    4'b0111 : alu_out = A ^ B;// xor
    4'b1000 : alu_out = A ~^ B; //xnor
    4'b1001 : alu_out = A << 1; // shift A to left 1 time and fill with zero
    4'b1010 : alu_out = A >> 1; // shift A to right 1 time and fill with zero
    4'b1011 : alu_out = &A; // AND all bits in vector A together
    4'b1100 : alu_out = |A; // OR all bits in vector A together
    4'b1101 : alu_out = ~&A; // NAND all bits in vector A together
    4'b1110 : alu_out = ^A; // XOR all bits in vector A together
    4'b1111 : alu_out = 4'b1111; // 1 output
           default : alu_out = 0;
       endcase
     end      
endmodule

module TB();
reg[3:0] A,B;
reg[3:0]OP;
wire[3:0]alu_out;
ALU a(A,B,OP,alu_out);
initial 
begin
  OP = 4'b0000;A=4'b0011;B=4'b0001;
  #10;
   OP = 4'b0001;A=4'b0011;B=4'b0001;
  #10;
   OP = 4'b1010;A=4'b0011;B=4'b0001;
  #10;
  OP = 4'b1000;A=4'b0011;B=4'b0001;
  #10;
   OP = 4'b1001;A=4'b0011;B=4'b0001;
  #10;
   OP = 4'b0010;A=4'b0011;B=4'b0001;
  #10;
   OP = 4'b1011;A=4'b0011;B=4'b0001;
  #10;
    OP = 4'b0011;A=4'b0011;B=4'b0001;
  #10;
end
endmodule