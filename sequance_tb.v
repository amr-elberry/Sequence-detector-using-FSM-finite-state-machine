
`timescale 1ns/1ps

module sequance_tb ();


reg clk_tb;
reg rst_tb;
reg seed_tb;
wire done_tb;



// Clock Period
parameter  CLK_PERIOD  = 10 ,
           HIGH_PERIOD = 0.5 * CLK_PERIOD ,
           LOW_PERIOD  = 0.5 * CLK_PERIOD ;
		   
		   
		   
sequance_detect dut(
.clk(clk_tb),
.rst(rst_tb),
.seed(seed_tb),
.o_done(done_tb)
);	   
		   
		   
// Clock Generator with 100 KHz (10 us)
  always  
   begin
    #LOW_PERIOD  clk_tb = ~ clk_tb ;
    #HIGH_PERIOD clk_tb = ~ clk_tb ;
   end
   
   


 /***************************************************************************************************/
 initial
  begin

	
	//initial values
clk_tb = 1'b0;
rst_tb = 1'b0;


// RST De-activation
# CLK_PERIOD ;
rst_tb = 1'b1 ;
    $display ("*** TEST CASE 1 ***");

enter_pass(0);
enter_pass(1);
enter_pass(1);
enter_pass(0);
enter_pass(1);
enter_pass(1);
enter_pass(1);
enter_pass(0);
#200  ;
$stop;
 end
 
 
 task enter_pass;
integer i ;
reg [7:0] pattern;
input x ;
begin
   for(i=9;i>1;i=i-1)
   begin
     # 10 ; 
    seed_tb<=x;
    pattern[i]<=seed_tb;
   end
   if(pattern==8'b01101110)
         $display ("*** TEST CASE 2 pass ***");
    else
          $display ("*** TEST CASE 2 failed ***");
end
endtask


endmodule


