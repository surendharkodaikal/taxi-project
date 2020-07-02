class tx_bfm;
	
	virtual tx_intf.bfm_mp vif;

	task run();
		vif= tx_cfg::wvif;
		forever begin
			tx t1;
			tx_cfg::gen2bfm.get(t1);
			$display("*************BFM is running*****************");
			$display("Transaction from gen2bfm mailbox");
			vif.valid <=1'b1;
			@(vif.bfm_cb);
			vif.bfm_cb.in <=t1.b;
			$display("T=%0t, %p",$time,t1);
			$display("Driving Tx into DUT");
		 	@(negedge vif.clk);
			vif.valid =1'b0;
			@(vif.bfm_cb);
			t1.incr_decr_error= vif.bfm_cb.incr_decr_error;
			$display("T=%0t, %p",$time,t1);

		end
	endtask

endclass
