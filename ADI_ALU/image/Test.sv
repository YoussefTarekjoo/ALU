package test_pkg ;
import env_pkg::*;
import Transaction_pkg::*;
class test ;

   env e0 ;
   mailbox drv_mbx ;
   
   function new() ;
      drv_mbx = new() ;
	  e0 = new() ;
   endfunction
   
   virtual task run() ;
      e0.d0.drv_mbx = drv_mbx ;
	  fork
	    e0.run() ;
	  join_none
	  apply_stim() ;
   endtask
   
   virtual task apply_stim() ;
      ALU_item item ;
	  $display("T = %0t [Test] starting stimulus ..." , $time) ;
	  item = new ;
	  assert(item.randomize()) ;
	  drv_mbx.put(item) ;
   endtask
   
endclass
endpackage