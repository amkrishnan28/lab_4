`timescale 1ns / 1ps

module atm(
    input wire clock,
    input wire ones,
    input wire twos,
    input wire fives,
    input wire tens,
    input wire twenties,
    input wire fifties,
    input wire hundreds,
    input wire fiveHundreds,
    input wire thousands,
    output reg [31:0] endAmount
);
    

    initial begin
        endAmount = 0;
    end
    
    always @ (posedge clock) begin
          endAmount = 0;
          
          if(ones) begin
                endAmount = endAmount + 1;
          end
          
          if(twos) begin
            endAmount = endAmount + 2;
          end
          
          if(fives) begin
            endAmount = endAmount + 5;
          end
          
          if(tens) begin
            endAmount = endAmount + 10;
          end
          
          if(twenties) begin
            endAmount = endAmount + 20;
          end
          
          
          if(fifties) begin
            endAmount = endAmount + 50;
          end
          
          
          if(hundreds) begin
            endAmount = endAmount + 100;
          end
          
          if(fiveHundreds) begin
            endAmount = endAmount + 500;
          end
          
          if(thousands) begin
            endAmount = endAmount + 1000;
          end
          
          
          
//        reg [31:0] increment;
//        increment = 0; // Initialize the increment variable
        
//        if (ones) begin
//            increment = increment + 1;
//        end
        
//        if (twos) begin
//            increment = increment + 2;
//        end
        
//        endAmount = increment; // Assign the final increment value to endAmount
    end


endmodule
