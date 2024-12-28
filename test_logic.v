
module test_logic (
    input [2:0] A_sum,
	 input A_cout,
    output reg D7,
    output reg D711,
    output reg D2312
);

    always @(*) begin
        
        case ({A_cout, A_sum})
            4'b0111: begin  // Equal to 7
                D7 = 1;
                D711 = 1;
                D2312 = 0;
            end
            4'b1011: begin  // Equal to 11
                D7 = 0;
                D711 = 1;
                D2312 = 0;
            end
            4'b0010,        // Equal to 2
            4'b0011,        // Equal to 3
            4'b1100: begin  // Equal to 12
                D7 = 0;
                D711 = 0;
                D2312 = 1;
            end
            default: begin
                D7 = 0;
                D711 = 0;
                D2312 = 0;
            end
        endcase
    end

endmodule
