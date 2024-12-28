module regDisp(
    input [3:0] inputnum,  // 4-bit number input
    output reg [6:0] seg1, // Ones place
    output reg [6:0] seg2  // Tens place
);

always @(inputnum) begin
    case (inputnum / 4'd10)  // Tens digit
        4'b0000: seg2 = ~7'b0111111; // 0
        4'b0001: seg2 = ~7'b0000110; // 1
        default: seg2 = ~7'b0000000; // Blank for values above 12
    endcase

    case (inputnum % 4'd10)  // Ones digit
        4'b0000: seg1 = ~7'b0111111; // 0
        4'b0001: seg1 = ~7'b0000110; // 1
        4'b0010: seg1 = ~7'b1011011; // 2
        4'b0011: seg1 = ~7'b1001111; // 3
        4'b0100: seg1 = ~7'b1100110; // 4
        4'b0101: seg1 = ~7'b1101101; // 5
        4'b0110: seg1 = ~7'b1111101; // 6
        4'b0111: seg1 = ~7'b0000111; // 7
        4'b1000: seg1 = ~7'b1111111; // 8
        4'b1001: seg1 = ~7'b1101111; // 9
        default: seg1 = ~7'b0000000; // Blank for invalid numbers
    endcase
end
endmodule 
