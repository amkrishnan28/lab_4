`timescale 1ns / 1ps
module debouncer(input button, input clk, output btn_state);
reg tempstate = 0;
reg [15:0] counter;
initial begin
counter = 0;
end

always @ (posedge clk) begin
if (button == 0) 
    begin
        counter <=0;
        tempstate <= 0;
    end
    else
    begin
        if (counter < 16'b1111_1111_1111_1111)begin
            counter <= counter + 1;
        end
        else begin
            tempstate <= 1;
            counter <= 0;
        end
    end
end
    
    
assign btn_state = tempstate; 
endmodule
