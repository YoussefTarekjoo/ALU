import env_pkg::*;

module tb ;

 bit clk ;
 env e0 ;
 
 always #10 clk = ~clk ;
 
 ALU_if _if(clk) ;
 
 ALU ALU_DUT 
 (
    .clk(_if.clk) , 
	.reset(_if.reset) ,
    .Opcode(_if.Opcode) ,
    .A(_if.A) ,	
    .B(_if.B) ,	
    .C(_if.C) , 
	.Division_by_Zero(_if.Division_by_Zero)
 );
 
 initial
  begin
   clk = 0 ;
   _if.reset = 0 ;
   #20
   _if.reset = 1 ;
   e0 = new() ;
   e0.v_if = _if ;
   e0.run();
   #30 $display ("correct_count = %0d , error_count = %0d", e0.s0.correct_count , e0.s0.error_count);
   $stop ;
  end
 
endmodule