module d_ff(
    input clk,  //intrare tact
    input rst_b, //intrare reset, aduce iesirea la 0
    input set_b,    //intrare set, aduce iesirea la 1
    input d,        //intrare sincrona date
    output reg q    //iesire bistabil
);

always @(posedge clk, negedge rst_b, negedge set_b)
    if(!set_b)
        q <= 1;
    else if(!rst_b)
        q <=0;
    else
        q <= d;

endmodule