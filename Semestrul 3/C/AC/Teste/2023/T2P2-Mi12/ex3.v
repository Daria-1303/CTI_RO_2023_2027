/* Construiti un testbench pentru modulul sh_rgst ce simuleaza secventa */
module sh_rgst#(parameter w=8)(input[w-1:0] d, input clk, rst_b, sh_in, ld, sh, output reg[w-1:0] q, output reg sh_out);

    always@(posedge clk or negedge rst_b) begin
        if(!rst_b) begin
            q <= d;
            sh_out <= 0;
        end
        else if(sh) begin
            q <= {sh_in, q[w-1:1]};
            sh_out <= q[0];
        end
        else begin
            q <= d;
            sh_out = sh_in;
        end
    end
endmodule

module sh_rgst_tb;
    /* Write Verilog code here */
endmodule
