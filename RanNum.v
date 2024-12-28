module RanNum(
    input clk,                // clk
    input roll,               
    input rst,          
    input choice,             // Choose frequency for clk 1 or 2
    output reg [2:0] die_out  // Output die
);
    wire feedback;
    reg clk_out;
    reg [1:0] counter;    
    reg [2:0] die;            // lfst register

    // state logic equation for the lfsr
    assign feedback = (die[2] ^ die[1]) ^ (~die[2] && die[1] && die[0]);
	 
    always @(posedge clk or negedge rst) begin
        if (!rst) begin				//if rst active low
            clk_out <= 0;          
            counter <= 0;          
        end else begin
            if (choice) begin
                
                clk_out <= ~clk_out;		//for 1/2 clk frequency
					 
            end else begin
						
                if (counter == 2) begin		//for 1/6 clk frequenc
                    clk_out <= ~clk_out;
                    counter <= 0;
                end else begin
                    counter <= counter + 1;
                end
            end
        end
    end
		//the actual changing the dice role on 1/2 or 1/6 clk frequency
    always @(posedge clk_out or negedge rst) begin
        if (!rst) begin
            die <= 3'b101;        //reset
        end else if (roll) begin
            die <= {die[1:0], feedback}; ///the shift of the lfsr
        end
    end
    // updates when roll is let go
    always @(negedge roll or negedge rst) begin
        if (!rst) begin
            die_out <= 3'b101;    //rst
        end else begin
            die_out <= die;       // output current die
        end
    end
