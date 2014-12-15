module CU (IRload, JMPmux, PCload, Meminst,
			MemWr, Asel, Aload, Sub, Halt, CheckState,
			Enter, Reset, Clock, IR, Aeq0, Apos);

input Enter, Clock, Reset, Aeq0, Apos;
input [7:5]IR;			
output reg IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt;
output reg [1:0]Asel;
output [3:0]CheckState; 
reg [3:0]State, NextState;

assign CheckState = State;

parameter start=4'b0000, fetch=4'b0001, decode=4'b0010, load=4'b1000,
		  store=4'b1001, add=4'b1010, sub=4'b1011, inputs=4'b1100,
		  jz=4'b1101, jpos=4'b1110, halt=4'b1111;
		  

always@(posedge Clock or negedge Reset)
begin
	if(!Reset)
		State <= start;
	else
		State <= NextState;
end

always@(State or Enter or IR)
	case(State)
		start	:	NextState = fetch;
		fetch	:	NextState = decode;
		decode	:
					case(IR)
						3'b000	:	NextState = load;
						3'b001	:	NextState = store;
						3'b010	:	NextState = add;
						3'b011	:	NextState = sub;
						3'b100	:	NextState = inputs;
						3'b101	:	NextState = jz;
						3'b110	:	NextState = jpos;
						3'b111	:	NextState = halt;
					default	:	NextState = decode;
					endcase
		load	:	NextState = start;
		store	:	NextState = start;
		add		:	NextState = start;
		sub		:	NextState = start;
		inputs	:	
					if(Enter)
						NextState = start;
					else
						NextState = inputs;
		jz		:	NextState = start;
		jpos	:	NextState = start;
		halt	:	NextState = halt;
	default		:	NextState = start;
	endcase

always@(State or Aeq0 or Apos)
begin
	case(State)
		start	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		fetch	:	begin
						IRload 	=	1'b1;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b1;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		decode	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b1;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
		
		load	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b10;
						Aload	=	1'b1;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		store	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b1;
						MemWr	=	1'b1;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		add	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b1;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
			
		sub	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b1;
						Sub		=	1'b1;
						Halt	=	1'b0;
					end
				
		inputs	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b01;
						Aload	=	1'b1;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
				
		jz	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b1;
						PCload 	= 	Aeq0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		jpos	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b1;
						PCload 	= 	Apos;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
					
		halt	:	begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b1;
					end
		
		default	:	
					begin
						IRload 	=	1'b0;
						JMPmux 	= 	1'b0;
						PCload 	= 	1'b0;
						Meminst = 	1'b0;
						MemWr	=	1'b0;
						Asel	=	2'b00;
						Aload	=	1'b0;
						Sub		=	1'b0;
						Halt	=	1'b0;
					end
	endcase
end

endmodule
