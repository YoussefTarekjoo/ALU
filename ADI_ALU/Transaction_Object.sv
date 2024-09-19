package Transaction_pkg ;
class ALU_item ;

   localparam MAXPOS = 7 ;
   localparam MAXNEG = -8 ;
   localparam ZERO   = 0 ;

   rand bit [1:0] Opcode ;
   rand bit signed [3:0] A , B ;
   bit signed [7:0] C ;
   bit Division_by_Zero ;
   
   //constraints for  A , B , Opcode
   
   constraint ALU_CONS {
     
	 A inside {MAXPOS , MAXNEG , ZERO} ;
	 B inside {MAXPOS , MAXNEG , ZERO} ;
	 
   }

   //This function prints the content of data pucket 
   
   function void display_packet(string tag ="") ;
    if(tag == "Monitor" || tag == "Driver")
     $display("T = %0t [%s] , Opcode = %0h , A = %0d , B = %0d , C = %0d , Division_by_Zero = %0d" , $time , tag , Opcode , A , B , C , Division_by_Zero) ;
   
   endfunction
  

endclass
endpackage