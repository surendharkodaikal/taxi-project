class tx_sbfm;
	tx t1;
	virtual tx_slave_intf.bfm_mp vif;

	task run();
		vif= tx_cfg::svif;
		forever begin
			t1=new;
			@(vif.bfm_cb);
			t1.incr_decr_error =vif.bfm_cb.incr_decr_error;
			$display("incr_decr_error=%d",t1.incr_decr_error);
		end
	endtask

endclass
	
