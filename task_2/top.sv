`include "counter.v"
`include "tx_intf.sv"
`include "tx_cfg.sv"
`include "ex.sv"
`include "tx_bfm.sv"
`include "tx_gen.sv"
`include "tx_mon.sv"
`include "tx_cov.sv"

`include "master_env.sv"
`include "tx_env.sv"
`include "tx_tb.sv"
module top;

reg clk,rst;

counter dut(
	.clk(pif.clk),
	.rst(pif.rst),
	.valid(pif.valid),
	.in(pif.in),
	.incr_decr_error(pif.incr_decr_error)
);

tx_intf pif(clk,rst);

initial begin
	clk=0;
	forever #5 clk=~clk;
end

initial begin
	$value$plusargs("testname=%s",tx_cfg::testname);
	reset_dut_inputs();	
	rst=1;
	@(posedge clk);
	rst=0;
end

task reset_dut_inputs();
	pif.in <=0;
endtask

tx_tb tb();

initial begin
	tx_cfg::wvif= pif;
end

initial begin
	#400 $finish;
end


endmodule
