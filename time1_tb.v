`timescale 1s/100ms;
module time_tb;
  reg clk,rst;
  wire [3:0] m_hr,l_hr,m_min,l_min,m_sec,l_sec;
  
  time1 dut(clk,rst,m_sec,l_sec,m_min,l_min,m_hr,l_hr);
  task rst_dut;
    begin
      @(negedge clk);
      rst=1;
      @(negedge clk);
      rst=0;
    end 
  endtask
  
  initial 
    begin
      clk=0;
      forever
        #0.5 clk=~clk;
    end
  
  initial 
    begin
      rst_dut;
      #(25*60*60);
      $finish;
    end
  
  initial 
  begin
    $monitor("clock counter value time=%d%d:%d%d:%d%d",m_hr,l_hr,m_min,l_min,m_sec,l_sec);
  end
endmodule
