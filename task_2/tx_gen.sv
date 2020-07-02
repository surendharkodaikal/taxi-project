class tx_gen;
	tx t1;

	task run();
		case(tx_cfg::testname)

			"INCREMENT_TEST" : begin
        				for (int j=0; j<20; j++) begin
						t1=new();
						$display("");
						$display("");
						$display("Generator block is running");
            					assert (t1.randomize() with {incr_decr==2'b00;});
						$display ("T=%0t, %p",$time,t1);
	    					$display("Putting the transaction into gen2bfm mailbox");
						tx_cfg::gen2bfm.put(t1);
						#20;
					end
				end
			
			"DECREMENT_TEST" : begin
        				for (int j=0; j<20; j++) begin
					t1=new();
						$display("");
						$display("");
						$display("Generator block is running");
            					assert (t1.randomize() with {incr_decr==2'b11;});
						$display ("T=%0t, %p",$time,t1);
	    					$display("Putting the transaction into gen2bfm mailbox");
	    					tx_cfg::gen2bfm.put(t1);
						#20;
					end
				end
			"ERROR_TEST" : begin
        				for (int j=0; j<20; j++) begin
					t1=new();
            					assert (t1.randomize());
						$display("");
						$display("");
						$display("Generator block is running");
						$display ("T=%0t, %p",$time,t1);
	    					tx_cfg::gen2bfm.put(t1);
	    					$display("Putting the transaction into gen2bfm mailbox");
						#20;
					end
				end
			endcase
		endtask
endclass

	
