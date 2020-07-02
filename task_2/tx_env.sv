class tx_env;

	master_env m_env=new();
	//slave_env  s_env=new();

	task run();
		fork
			m_env.run();
	//		s_env.run();
		join
	endtask
endclass
