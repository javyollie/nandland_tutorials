module Clocked_Logic
    (input i_Clk,
     input i_Switch_1,
     output o_LED_1);

    reg r_LED_1    = 1'b0;
    reg r_Switch_1 = 1'b0;

   /* Container to keep track of a certain group of signals
    * sequential always blocks or clocked (Only triggered when one of the 
    * sensitivity signals changes; btw @ and parenthesis).
    * Note: combinational not dependent on clk. (Derived from LUTs) 
    */
    always  @ (posedge i_Clk)    
        begin
        // Registered version of the input switch
        // <= non-blocking assignment operator
        // NANDLAN blocking vs non-blocking article for more info.
            r_Switch_1 <= i_Switch_1;  // Creates register

            if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) // Only Falling Edge
                begin
                    r_LED_1 <= ~r_LED_1; // Toggles the LED
                end
        end

    assign o_LED_1 = r_LED_1;

endmodule // Clocked_Logic