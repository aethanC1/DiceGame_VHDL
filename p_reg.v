module p_reg(Sp, A_Co, A_sum, rst, R_out);
    input Sp; 
    input A_Co;
    input [2:0] A_sum;
	 input rst; //add in datapath
    output reg [3:0] R_out; 
	 
    
    always @(posedge Sp or negedge rst) begin
		if (~rst) begin
			R_out <= 4'b0000;
		end 
		else begin
			R_out <= {A_Co, A_sum}; // Concatenate A_Co and A_sum into R_out
		end
	end
endmodule
