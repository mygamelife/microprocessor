module RAM_8bits_tb;

reg [7:0] address, dataIn;
reg WE, clock, testStart;
wire[7:0] dataOut;
reg [7:0] RAM[31:0];
integer i;

RAM_8bits testing(address, WE,dataIn, dataOut, clock, testStart);
initial clock = 0;
always #10 clock = ~clock;

initial
begin
  #10 WE = 1'b0; dataIn = 8'd5; testStart = 1'b1;
  #30 WE = 1'b0; dataIn = 8'd5; testStart = 1'b0;
  for(address=0; address<20; address = address+1)
    begin
      #20
      $display("%d %b", address, dataOut); 
    end

  $finish;
  
end

endmodule
