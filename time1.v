module time1(input clk,rst, output reg [3:0] m_sec,l_sec,m_min,l_min,m_hr,l_hr);
  
  always@(posedge clk)
    if(rst)
      begin
        {m_sec,l_sec,m_min,l_min,m_hr,l_hr}=0;
      end
  else
    begin
      l_sec <= l_sec + 1;
      if(l_sec==4'd9)
        begin
         l_sec <= 0;
         m_sec <= m_sec+1;
          if(m_sec==4'd5)
            begin
              if(l_sec==4'd9)
                begin
              l_sec <= 0;
              m_sec <=0;
              l_min <= l_min+1;
                  if(l_min==4'd9)
                    begin
          l_min <= 0;
          m_min <= m_min+1;
                      if(m_min==4'd5)
                        begin
                          if(l_min==4'd9)
                            begin
              l_sec <= 0;
              m_sec <=0;
              l_min <= 0;
              m_min <= 0;
              l_hr <= l_hr+1;
                              if(l_hr==4'd9)
                                begin
          l_hr <=0;
          m_hr <= m_hr+1;
                                  if(m_hr==4'd2)
                                    begin
                                      if(l_hr>=4'd3)
                                        begin
                                  
                                       {m_sec,l_sec,m_min,l_min,m_hr,l_hr}=0;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
endmodule
