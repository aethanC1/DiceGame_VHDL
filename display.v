
module display(
 input [2:0] inputnum,
 output reg [6:0] seg
);

 always @(inputnum) begin
 case (inputnum)
 3'b000: seg =  ~7'b0111111;
 3'b001: seg =  ~7'b0000110;
 3'b010: seg =  ~7'b1011011;
 3'b011: seg =  ~7'b1001111;
 3'b100: seg =  ~7'b1100110;
 3'b101: seg =  ~7'b1101101;
 3'b110: seg =  ~7'b1111101;
 
 endcase
 end 
 endmodule
 
