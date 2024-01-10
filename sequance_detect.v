module sequance_detect(
input wire clk,rst,seed,
output reg o_done
);
localparam s0 = 4'b0000,s1 = 4'b0001,s2 = 4'b0010,s3 = 4'b0011,s4 = 4'b0100,s5 = 4'b0101,s6 = 4'b0110,s7 = 4'b0111,s8 = 4'b1000;

reg done ;
reg [3:0]  current_state,next_state;
/*************************************************************state transition *********************************************************/
always@(posedge clk or negedge rst)
begin
if(!rst)
begin 
    current_state <=0;
	o_done <= 1'b0 ;
end 
else
begin
     current_state <= next_state; 
	 o_done <= done ;
end
end
/***************************************************************************************************************************************/


/*************************************************************combinantial part ********************************************************/
always@(*)
		begin
			done = 0;
			case(current_state)
				s0:
					begin
						if(seed == 0)
						next_state = s1;
						else
						next_state = s0;
					end
				s1:
					begin
						if(seed == 1)
						next_state = s2;
						else
						next_state = s0;
					end
				s2:
					begin
						if(seed == 1)
						next_state = s3;
						else
						next_state = s0;
					end
				s3:
					begin
						if(seed == 0)
						next_state = s4;
						else
						next_state = s0;
					end
				s4:
					begin
						if(seed == 1)
						next_state = s5;
						else
						next_state = s0;
					end
				s5:
					begin
						if(seed == 1)
						next_state = s6;
						else
						next_state = s0;
					end
				s6:
					begin
						if(seed == 1)
						next_state = s7;
						else
						next_state = s0;
					end
				s7:
					begin
						if(seed == 0)
						done =1;
						else
						next_state = s0;
					end

			endcase

		end
endmodule
/***************************************************************************************************************************************/
