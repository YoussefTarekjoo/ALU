package env_pkg ;
import Transaction_pkg::*;
import Driver_pkg::*;
import Monitor_pkg::*; 
import scoreboard_pkg::*;
import seq_pkg::*;

class env ;
   sequencer g0 ;
   Driver d0 ;
   Monitor m0 ;
   scoreboard s0 ;
   mailbox scoreboard_mbx ;
   mailbox drv_mbx;
   virtual ALU_if v_if ;
   event drv_done;

   function new() ;
      g0 = new ;
      d0 = new ;
	  m0 = new ;
	  s0 = new ;
	  scoreboard_mbx = new() ;
	  drv_mbx = new() ;
   endfunction
   
   virtual task run() ;
      d0.v_if = v_if ;
	  m0.v_if = v_if ;
	  m0.scoreboard_mbx = scoreboard_mbx ;
	  s0.scoreboard_mbx = scoreboard_mbx ;
	  g0.drv_mbx = drv_mbx ;
	  d0.drv_mbx = drv_mbx ;
	  g0.drv_done = drv_done ;
	  d0.drv_done = drv_done ;
	  fork
       g0.run() ;	  
       s0.run() ;
	   d0.run() ;
	   m0.run() ;
      join_any
   endtask
   
endclass
endpackage