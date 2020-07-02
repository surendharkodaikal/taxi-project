// I am trying to randomize the number of riders who wants to travel and based on number of riders I will be deciding which cab to be assigned. If riders are just 3 and they want 5 seat or 6 seat taxi, that is also possible. Using post randomize concept to count number of used taxi.



typedef enum {car[2], van[2], suv} taxi_t;
class taxi_tx;

	rand int riders;
	randc taxi_t taxi;
	static taxi_t taxi_q[$];
	int available_vehicle;
	static int count_car;
	static int count_van;
	static int count_suv;

	function void post_randomize();
		if((taxi == car0) || (taxi ==car1)) begin
			count_car=count_car+1;
		end
		if((taxi == van0) || (taxi ==van1)) begin
			count_van=count_van+1;
		end
		if(taxi == suv) begin 
			count_suv=count_suv+1;
		end


	endfunction 

	function void print();
		$display("**************************************************************");
		$display("Number of riders going to travel:%d",riders);
		$display("Taxi which is booked:%s",taxi);
		available_vehicle=5 - count_car - count_van - count_suv; 
		$display("Total number of available taxis: %d",available_vehicle);
		$display("Total time in min:",$time);
		taxi_q.push_back(taxi);
		$display("The taxis which are currently being used: %p",taxi_q);
		$display("**************************************************************");
	endfunction



	constraint riders_c{ riders<=6; riders >=1;}

	constraint vehicle_c{ (riders inside {[1:3]}) -> (taxi inside {car0,car1,suv,van0,van1});
			      (riders==4) -> (taxi inside {suv,van0,van1});
			      (riders inside {[5:6]}) ->  (taxi inside {van0,van1});
				}

endclass

module top;
taxi_tx t1;

initial begin
		t1=new();
		for(int i=0; i<5; i++) begin
		assert(t1.randomize());	
		$display("%p",t1);
		#10
		t1.print();
		
	end
end
endmodule
