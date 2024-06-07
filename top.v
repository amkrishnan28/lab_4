module top (
    input wire clk,
    input btnD,
    input btnU,
    input wire [15:0] sw, 
    output wire [0:6] seg,
    output wire [3:0] an
);
    
    wire deposit;
    wire withdraw;
    wire [31:0] endAmount;
    reg [31:0] balance;
    reg [31:0] amount;
    
    wire clk_2Hz;
    initial begin 
        amount = 0;
//        deposit = 0;
//        withdraw =0 ;
        balance = 1000;
        
    end
    
    clk clock (
        .clk_100MHz(clk),  // 100 MHz master clock input
        .clk_2Hz(clk_2Hz),
        .clk_1Hz(clk_1Hz),
        .clk_fast(clk_fast),
        .clk_adjust(clk_adjust)
    );
    debouncer deposit_signal (
       .button(btnU),
       .clk(clk), 
       .btn_state(deposit)
    );
   debouncer withdraw_signal (
       .button(btnD),
       .clk(clk), 
       .btn_state(withdraw)
    );
    
    atm uut (
        .clock(clk),
        .ones(sw[1]),
        .twos(sw[2]),
        .fives(sw[3]),
        .tens(sw[4]),
        .twenties(sw[5]),
        .fifties(sw[6]),
        .hundreds(sw[7]),
        .fiveHundreds(sw[8]),
        .thousands(sw[9]),
        .endAmount(endAmount)
    );
    
    
    
    // Instantiate the counting module
    reg intermediate;
   
    always @ (posedge clk) begin
        intermediate = withdraw | deposit;
    end
    
    always @ (posedge intermediate) begin
    
        if(deposit == 1) begin
            balance = balance + endAmount;
            if(balance > 9999) begin
                balance = 9999;
            end
        end
        
        if(withdraw == 1) begin
            if(endAmount > balance) begin
                
            end
            else begin
                balance = balance - endAmount;
            end
        end
    end
 
//    always @ (posedge deposit or posedge withdraw) begin
//        if(deposit) begin
//            balance = balance + endAmount;
//        end 
        
//        if(withdraw) begin
//            balance = balance - endAmount;
//        end
//    end

    
    
    
   
    


    
    // Instantiate the 7-segment display module
    sevsegdisplay display (
        .number(balance),
        .clk(clk),
        .seg(seg),
        .digit(an)
    );
    
//    always @ (intermediate_rst) begin
//        reset <= intermediate_rst;
//    end
    
    
//   always @ (posedge clk) begin
//        if(btnD == 0) begin
//            counter <= 0;
//            reset <= 0;
//        end
//        else begin
//            counter <= counter + 1;
//             if(counter == 16'b1111_1111_1111_1111) begin
//                reset <= 1;
//                counter <= 0;
//            end
//        end
//   end
   
   
   
    
    
    
   
    

endmodule