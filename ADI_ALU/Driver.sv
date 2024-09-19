package Driver_pkg ;
import Transaction_pkg::*;
class Driver ;

virtual ALU_if v_if ;
event drv_done ;
mailbox drv_mbx ;

task run() ;
   $display("T = %0t [Driver] starting ..." , $time) ;
   forever begin
     ALU_item item ;
	 drv_mbx.get(item) ;
	 item.display_packet("Driver") ;
	 v_if.Opcode = item.Opcode ;
	 v_if.A = item.A ;
	 v_if.B = item.B ;
	 @(posedge v_if.clk) ;
	 ->drv_done;
   end

endtask

endclass
endpackage