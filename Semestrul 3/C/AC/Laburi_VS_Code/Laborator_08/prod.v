module prod (
    input clk,
    input rst_b,
    output reg val,
    output reg [7:0] data
);
// produce valorii aleatorii intre 0 si 5
integer cntv, cntiv; 
// cntv - contor valori, cntiv - contor initializare valori

always @(posedge clk, negedge rst_b) begin
    // initializare
    if(!rst_b) begin
        val <= 0;
        cntiv <= 1; // pt ca la fiecare reset cntiv trebuie sa fie 1
    end

    else if(cntv > 0) begin
        val <= 1; // putem produce valori
        cntv <= cntv - 1; // decrementam contorul

        if(cntv == 1) begin
            val <= 0; // nu mai putem produce valori
            cntiv <= $urandom_range(1, 4); // generam un numar aleatoriu intre 1 si 4
        end
        else
            data <= $urandom_range(0, 5); // generam un numar aleatoriu intre 0 si 5
    end

    else if(cntiv > 0) begin
        val <= 0; // nu mai putem produce valori
        cntiv <= cntiv - 1; // decrementam contorul

        if(cntiv == 1) begin
            val <= 1; // putem produce valori
            data <= $urandom_range(0, 5); // generam un numar aleatoriu intre 0 si 5
            cntv <= $urandom_range(3, 5); // generam un numar aleatoriu intre 3 si 5
        end
    end
end

endmodule

module prod_tb;
  reg clk,rst_b;
  wire val;
  wire [7:0] data;
  
  prod inst1(.clk(clk),.rst_b(rst_b),.val(val),.data(data));
  localparam CLK_PERIOD=100, RUNNING_CYCLES=100, RST_DURATION=25;
  initial begin
    $display("time\tclk\trst_b\tval\tdata");
    $monitor("%5t\t%b\t%b\t%b\t%1d",$time,clk,rst_b,val,data);
    clk=0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk=~clk;
  end
  initial begin
    rst_b=0;
    #RST_DURATION rst_b=~rst_b;
  end
endmodule