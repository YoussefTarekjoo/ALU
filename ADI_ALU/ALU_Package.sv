package ALU_pkg;

    // Define constants
    localparam MAXPOS = 7 ;
    localparam MAXNEG = -8 ;
    localparam ZERO   = 0 ;

    // Define the opcode enum
    typedef enum logic [1:0] {
        ADD                 = 2'b00 , 
        SUB                 = 2'b01 , 
        MULT                = 2'b10 ,
        DIV                 = 2'b11 
    } opcode_e;

endpackage