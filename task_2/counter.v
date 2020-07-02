module counter(clk, rst, valid, in, incr_decr_error);

input clk,rst,valid;
input [3:0] in;
output reg [2:0] incr_decr_error;
reg [3:0] state, next_state;
parameter INCR=3'b100, DECR=3'b010, ERROR=3'b001, STABLE=3'b000;
parameter S0=4'b0000, S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,S5=4'b0101,S6=4'b0110,S7=4'b0111,S8=4'b1000,S9=4'b1001,S10=4'b1010,S11=4'b1011,S12=4'b1100,S13=4'b1101,S14=4'b1110,S15=4'b1111;

always@(posedge clk or posedge rst) begin
	if(rst)begin
		state<=S0;
	end
	else begin
		if(valid) begin
		state<=next_state;
	end
	end
end
always@(state,in) 
case(state)

	S0:begin
		incr_decr_error=(in==0)? STABLE:((in==1)? INCR: ((in==15)? DECR :ERROR));
	        next_state=(in==0)? S0: ((in==1)? S1: ((in==15)? S15 : S0));
	   end	
	S1:begin
		incr_decr_error=(in==1)? STABLE:((in==2)? INCR: ((in==0)? DECR :ERROR));
	        next_state=(in==1)? S1: ((in==2)? S2: ((in==0)? S0 : S1));
	   end	
	S2:begin
		incr_decr_error=(in==2)? STABLE:((in==3)? INCR: ((in==1)? DECR :ERROR));
	        next_state=(in==2)? S2: ((in==3)? S3: ((in==1)? S1 : S2));
	   end	
	S3:begin
		incr_decr_error=(in==3)? STABLE:((in==4)? INCR: ((in==2)? DECR :ERROR));
	        next_state=(in==3)? S3: ((in==4)? S4: ((in==2)? S2 : S3));
	   end	
	S4:begin
		incr_decr_error=(in==4)? STABLE:((in==5)? INCR: ((in==3)? DECR :ERROR));
	        next_state=(in==4)? S4: ((in==5)? S5: ((in==3)? S3 : S4));
	   end	
	S5:begin
		incr_decr_error=(in==5)? STABLE:((in==6)? INCR: ((in==4)? DECR :ERROR));
	        next_state=(in==5)? S5: ((in==6)? S6: ((in==4)? S4 : S5));
	   end	
	S6:begin
		incr_decr_error=(in==6)? STABLE:((in==7)? INCR: ((in==5)? DECR :ERROR));
	        next_state=(in==6)? S6: ((in==7)? S7: ((in==5)? S5 : S6));
	   end	
	S7:begin
		incr_decr_error=(in==7)? STABLE:((in==8)? INCR: ((in==6)? DECR :ERROR));
	        next_state=(in==7)? S7: ((in==8)? S8: ((in==6)? S6 : S7));
	   end	
	S8:begin
		incr_decr_error=(in==8)? STABLE:((in==9)? INCR: ((in==7)? DECR :ERROR));
	        next_state=(in==8)? S8: ((in==9)? S9: ((in==7)? S7 : S8));
	   end	
	S9:begin
		incr_decr_error=(in==9)? STABLE:((in==10)? INCR: ((in==8)? DECR :ERROR));
	        next_state=(in==9)? S9: ((in==10)? S10: ((in==8)? S8 : S9));
	   end	
	S10:begin
		incr_decr_error=(in==10)? STABLE:((in==11)? INCR: ((in==9)? DECR :ERROR));
	        next_state=(in==10)? S10: ((in==11)? S11: ((in==9)? S9 : S10));
	   end	
	S11:begin
		incr_decr_error=(in==11)? STABLE:((in==12)? INCR: ((in==10)? DECR :ERROR));
	        next_state=(in==11)? S11: ((in==12)? S12: ((in==10)? S10 : S11));
	   end	
	S12:begin
		incr_decr_error=(in==12)? STABLE:((in==13)? INCR: ((in==11)? DECR :ERROR));
	        next_state=(in==12)? S12: ((in==13)? S13: ((in==11)? S11 : S12));
	   end	
	S13:begin
		incr_decr_error=(in==13)? STABLE:((in==14)? INCR: ((in==12)? DECR :ERROR));
	        next_state=(in==13)? S13: ((in==14)? S14: ((in==12)? S12 : S13));
	   end	
	S14:begin
		incr_decr_error=(in==14)? STABLE:((in==15)? INCR: ((in==13)? DECR :ERROR));
	        next_state=(in==14)? S14: ((in==15)? S15: ((in==13)? S13 : S14));
	   end	
	S15:begin
		incr_decr_error=(in==15)? STABLE:((in==0)? INCR: ((in==14)? DECR :ERROR));
	        next_state=(in==15)? S15: ((in==0)? S0: ((in==14)? S14 : S15));
	   end
	/*default: begin 
      		incr_decr_error= STABLE;
		next_state= S0;	
	end*/
   endcase
endmodule

