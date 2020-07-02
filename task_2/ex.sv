class tx;
        static bit [3:0] b,ib,db;
	static bit count;
	rand bit [1:0] incr_decr;
	static bit a;
	bit [2:0] incr_decr_error;

//	constraint id{incr_decr==2'b10;}
  //      constraint c1 {b > const'(b) ;}
	constraint bc{b>=0; b<=15;}

	function void pre_randomize();
		if(a==1) begin
			b=ib;
		end
		if(a==0) begin
			b=db;
		end
	endfunction


	function void post_randomize();
		if(count==0) begin
			case(incr_decr)
			2'b00: begin
				count=count+1;
				b=0;
			       end
			2'b11: begin
				count=count-1;
				b=0;
			       end
			       default: begin
				       count=0;
				       b=0;
			       end
			endcase

		end
		else begin
			case(incr_decr)
			
				2'b00 : begin 
					ib=b+1;
					b=ib;
					a=1;
				end
					
				2'b11 : begin 
					db=b-1;
					b=db;
					a=0;
				end

			default : b=b+2;
			endcase
		end
	endfunction
endclass
module top;
    tx t1;
    initial begin
        t1 = new();
        for (int j=0; j<20; j++) begin
            assert (r1.randomize() with {incr_decr==2'b00;});
            $display ("Iteration_number:%0d b:%0d", j, r1.b);
	    $display ("%p",r1);
        end 
    end
endmodule
