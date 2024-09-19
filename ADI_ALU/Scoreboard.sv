package scoreboard_pkg ; 
import Transaction_pkg::* ;

class scoreboard ;

mailbox scoreboard_mbx ;
bit signed [7:0] C_exp ;
int correct_count;
int error_count;

     function  new();
        correct_count = 0 ; 
        error_count = 0 ;
        C_exp = 0 ;
     endfunction 

task run() ;
	forever begin
	   ALU_item item ; 
	   scoreboard_mbx.get(item) ;
	   case (item.Opcode)
      	2'b00:            C_exp = item.A + item.B;
      	2'b01:            C_exp = item.A - item.B;
      	2'b10:            C_exp = item.A * item.B;
      	2'b11: begin
		  if(item.B == 0)
		   begin
			C_exp = 8'hff ;
		   end
		  else
		   begin
		    C_exp = item.A / item.B;
		   end
		end
        default:        C_exp = 8'b0 ;
      endcase
	  if (C_exp != item.C) begin
                $display("T = %0t [Scoreboard] ERROR! , C_exp = %0d , item.C = %0d" , $time , C_exp , item.C);
                error_count = error_count + 1 ;
            end else begin
                $display("T = %0t [Scoreboard] SUCCESS! , C_exp = %0d , item.C = %0d" , $time , C_exp , item.C);
                correct_count = correct_count + 1 ;
            end
	  
	end
  
endtask

endclass
endpackage
