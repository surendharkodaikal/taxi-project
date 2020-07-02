class tx_cov;
tx t1;
	covergroup tx_cg;
		DATA: coverpoint t1.b {

			bins zero ={0};
			bins one ={1};
			bins two ={2};
			bins three ={3};
			bins four ={4};
			bins five ={5};
			bins six ={6};
			bins seven ={7};
			bins eight ={8};
			bins nine ={9};
			bins ten ={10};
			bins eleven ={11};
			bins twelve ={12};
			bins thirteen ={13};
			bins fourteen ={14};
			bins fifteen ={15};
			
		}

		INCR_DECR_ERROR: coverpoint t1.incr_decr_error {

			bins INCR ={4};
			bins DECR ={2};
			bins ERROR={1};
			bins STABLE={0};
		}

	endgroup

	function new();
		tx_cg=new();
	endfunction

	task run();
		$display("Coverage");
		forever begin
			tx_cfg::mon2cov.get(t1);
			tx_cg.sample();
		end
	endtask

endclass
