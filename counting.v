`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:55:13 PM
// Design Name: 
// Module Name: counting
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counting(
    input wire timer,
    input wire ones,
    input wire twos, 
    input wire five,
    input wire tens,
    input wire twenty,
    input wire fifty,
    input wire hundred,
    input wire fiveHundred,
    input wire thousand,
    input wire [31:0] balance,
    input wire deposit,
    input wire withdraw,
    output reg[31:0] endBalance
    );
    
    reg [31:0] curBalance;
    reg [31:0] amount;
    initial begin 
      curBalance = 0;  
      amount = 0;
      endBalance = 0;
    end
    
    always @ (posedge timer) begin
        curBalance <= balance;
         amount <= 0;
        if(ones) begin
            amount <= amount + 1;
        end  
        
        
        if(twos) begin
            amount <= amount + 2;
        end  
       
       
       if(five) begin 
            amount <= amount + 5;
       end
       
       if(tens) begin
            amount <= amount + 10;
       end
       if(twenty) begin
           amount <= amount + 10;
       end
       if(fifty) begin
           amount <= amount + 50;
       end
       if(hundred) begin
                  amount <= amount + 100;
        end
        
        if(deposit) begin
            if(amount + curBalance > 9999) begin
                curBalance <= 9999;
            end
            
            else begin
                curBalance <= curBalance + amount;
            end
        end
        
        if(withdraw) begin
            if(amount > curBalance) begin
               
            end
            else begin
                curBalance <= curBalance - amount;
            end        
        end
        
//        assign endBalance = curBalance;
       
          
//        if(reset) begin
//            seconds <= 0;
//            minutes <= 0;
//        end
//        else if (seconds == 59) begin
//            seconds <= 0;
//            if(minutes == 59) begin
//                minutes <= 0;
//            end
//            minutes <= minutes + 1;
        
//        end    
//        else  begin
        
//                if(enable) begin
//                  seconds <= seconds + 1;
//                end
        end     
        
       
//         if (reset) begin
//            seconds <= 0;
//            minutes <= 0;
      //  end
//        if (enable) begin
//            if(seconds == 59) begin
//                minutes <= minutes + 1;
//                seconds <= 0;
//                if (minutes == 60) begin
//                    minutes <= 0;
//                    seconds <= 0;
//                end
//            end
//            else begin
//                 seconds <= seconds + 1;
//            end
       // end
endmodule