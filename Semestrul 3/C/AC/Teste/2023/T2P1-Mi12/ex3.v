module sh_rgst#(parameter w=8)(input[w-1:0] d, input clk, rst_b, sh_dir, ld, input[3:0] sh_pos, output reg[w-1:0] q);

    always@(posedge clk or negedge rst_b) begin
        if(!rst_b) begin
            q <= 0;
        end
        else if(ld) begin
            q <= d;
        end
        else begin
            if(sh_dir == 0) q <= q << sh_pos;
            else q <= q >> sh_pos;
        end
    end
endmodule

module sh_rgst_tb;
    
endmodule
