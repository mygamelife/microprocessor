module microprocessor(
					input [7:0]data_in,
					input Enter,
					input Reset,
					input Clock,
					input testStart,
					output [7:0]dataOut,
					output [3:0]CheckState,
                    output [2:0]IR,
					output Halt,
                    output IRload);

wire PCload, JMPmux, Meminst, MemWr,Aload,Sub;
wire [1:0] Asel;
wire Apos,Aeq0;

GeneralDatapath	dataPath (PCload,JMPmux,IRload,Meminst,MemWr,Aload,
						  Reset,Clock,Sub,Asel,Aeq0,Apos,IR,data_in,dataOut,testStart);
                          
CU controlUnit (IRload, JMPmux, PCload, Meminst,MemWr, Asel, Aload,
				Sub, Halt, CheckState,Enter, Reset, Clock, IR, Aeq0, Apos);
                
endmodule
