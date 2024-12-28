
module comp(
    input [3:0] a,
    input [3:0] b,
    input sig,         // Clock signal
    input rst,
	     output reg match   // Match output
);

    always @(*) begin
        if (!rst) begin
            // Reset match to default value
            match <= 1'b0;
        end else begin
                if (a == b)
                    match <= 1'b1;
                else
                    match <= 1'b0;
        end
    end
	 
endmodule
