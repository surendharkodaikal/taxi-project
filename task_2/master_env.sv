class master_env;
	tx_bfm bfm=new();
	tx_gen gen=new();
	tx_mon mon=new();
	tx_cov cov=new();

	task run();

		fork
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask
endclass
