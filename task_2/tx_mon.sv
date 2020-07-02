class tx_mon;
	virtual tx_intf.mon_mp vif;
	tx t1;
		
		task run();
			vif =tx_cfg::wvif;
			forever begin
				t1=new();
				@(vif.mon_cb);
				#1
				t1.b = vif.mon_cb.in;
				t1.incr_decr_error = vif.mon_cb.incr_decr_error;
				$display("Monitor is running");
				$display("Going to put transaction in mon2cov mailbox");
				$display ("T=%0t, %p",$time,t1);
				tx_cfg::mon2cov.put(t1);
			end
		endtask
endclass
