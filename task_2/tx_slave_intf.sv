interface tx_slave_intf(input logic clk, input logic rst);
	logic [2:0] incr_decr_error;

clocking bfm_cb@(posedge clk);
	input  #0 incr_decr_error;
endclocking

clocking mon_cb@(posedge clk);
	input #0 incr_decr_error;
endclocking

modport bfm_mp(input clk,rst,clocking bfm_cb);
modport mon_mp(input clk,rst,clocking mon_cb);
endinterface
