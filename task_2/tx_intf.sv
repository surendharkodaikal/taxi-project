interface tx_intf (input logic clk, input logic rst);
	//logic rst;
	logic [3:0] in;
	logic [2:0] incr_decr_error;
	logic valid;

clocking bfm_cb@(posedge clk);
	output rst;
	output #0 in;
	output #0 valid;
	input  #0 incr_decr_error;

endclocking

clocking mon_cb@(posedge clk);
	input rst;
	input #0 in;
	input #0 valid;
	input #0 incr_decr_error;
endclocking

modport bfm_mp(input clk,rst,valid, clocking bfm_cb);
modport mon_mp(input clk,rst,valid,clocking mon_cb);


endinterface
