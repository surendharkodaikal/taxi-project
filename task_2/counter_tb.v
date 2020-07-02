`include "counter.v"
module tb;
reg clk,rst;
reg [3:0] in;
wire [2:0] incr_decr_error;

counter dut(clk,rst,in,incr_decr_error);

initial begin
	clk=1'b0;
	rst=1'b1;
	#15 rst= 1'b0;
end

initial begin
forever #5 clk=~clk;
end

initial begin
	#12 in=0; #10 in=0; #10 in=1;
	#10 in=2; #10 in=3; #10 in=4; #10 in=4;
	#10 in=5; #10 in=6; #10 in=7;
	#10 in=8; #10 in=9; #10 in=10;
	#10 in=11; #10 in=12; #10 in=13;
	#10 in=14; #10 in=15; #10 in=0;

	#20 $finish;

end
initial begin
	$monitor("in=%d,incr_decr_error=%b",in,incr_decr_error);
end
endmodule
