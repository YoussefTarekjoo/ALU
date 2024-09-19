package seq_pkg ;
import Transaction_pkg::*;

class sequencer ;
	int loop = 1000;
	event drv_done;
	mailbox drv_mbx;

	task run() ;
		for(int i=0; i<loop ;i++) begin
			ALU_item item = new ;
			assert(item.randomize());
			$display("T=%0t [Generator] Loop: %0d creat new item",$time,i);
			drv_mbx.put(item);
			$display("T=%0t [Generator] waiting for driver to done",$time);
			@(drv_done);
		end
	endtask
endclass
endpackage
