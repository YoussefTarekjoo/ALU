package Monitor_pkg ;
import Transaction_pkg::*;
class Monitor ;

virtual ALU_if v_if ;
mailbox scoreboard_mbx ;
ALU_item item ;

task run() ;
 
   $display("T = %0t [Monitor] starting ..." , $time) ;
   forever begin
     ALU_item item = new ;
	 item.Opcode <= v_if.Opcode ;
	 item.A <= v_if.A ;
	 item.B <= v_if.B ;
	 @(posedge v_if.clk);
	 item.C = v_if.C ;
	 item.Division_by_Zero = v_if.Division_by_Zero ;
	 item.display_packet("Monitor") ;
	 scoreboard_mbx.put(item) ;
   end

endtask

endclass
endpackage