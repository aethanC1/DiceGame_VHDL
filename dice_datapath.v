module dice_datapath(
	input Roll,
	input Sp,
	input clk,
	input rst,
	output D7,
	output D711,
	output D2312,
	output Eq,
	output [6:0] seg_1, //dice one
	output [6:0] seg_2, //dice two
	output [6:0] seg_3, //p_reg 
	output [6:0] seg_4, //p_reg 
	output [6:0] seg_5, //adder
	output [6:0] seg_6  //adder
);
	
	wire [2:0] die1;
	wire [2:0] die2;
	
	
	wire [2:0] sum;
	wire Cout;
	wire [3:0] Rout;
	wire [3:0] current_add;
	
	assign current_add = {Cout, sum};

	adder ad1(
		.dataa(die1),
		.datab(die2),
		.result(sum),
		.cout(Cout)
	);
	
	test_logic tl1(
		.A_sum(sum),
		.A_cout(Cout),
		.D7(D7),
		.D711(D711),
		.D2312(D2312)
	);
	
	
	p_reg pointreg(
		.Sp(Sp),
		.A_Co(Cout),
		.A_sum(sum),
		.rst(rst),
		.R_out(Rout)
	);
	
	display disp1(
		.inputnum(die1),
		.seg(seg_1)
	);
	
	display disp2(
		.inputnum(die2),
		.seg(seg_2)
	);
	
	RanNum dice1(
		.clk(clk),
		.roll(Roll),
		.rst(rst),
		.choice(1'b1),
		.die_out(die1)
	);
	
	RanNum dice2(
		.clk(clk),
		.roll(Roll),
		.rst(rst),
		.choice(1'b0),
		.die_out(die2)
	);
	
	comp comparator(
		.a(current_add),
		.b(Rout),
		.sig(clk),
		.rst(rst),
		.match(Eq)
	);
	
	regDisp regDisp(
		.inputnum(Rout),
		.seg1(seg_3), //ones place
		.seg2(seg_4) //10s place
	);
	
	regDisp adderDisp(
		.inputnum(current_add),
		.seg1(seg_5),
		.seg2(seg_6)
	);


endmodule 
