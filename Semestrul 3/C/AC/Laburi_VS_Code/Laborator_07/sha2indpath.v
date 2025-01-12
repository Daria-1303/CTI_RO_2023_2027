module sha2indpath #(
	parameter reg_w=64,
	parameter reg_cnt=8,
	parameter dec_w=3
)(
	input clk,
	input rst_b,
	input [reg_w-1:0] pkt,	
	input st_pkt,
	input clr,
	input pad_pkt,
	input zero_pkt,
	input mgln_pkt,
	output [dec_w-1:0] idx,
	output [reg_cnt*reg_w-1:0] blk
);

wire [reg_w-1:0] msg_len_temp;  // message length temporary
wire [reg_w-1:0] msg_out;    // message output 

// pktmux module

pktmux #(.w(reg_w)) pktmux_inst(
    .pkt(pkt),
    .pad_pkt(pad_pkt),
    .zero_pkt(zero_pkt),
    .mgln_pkt(mgln_pkt),
    .msg_len(msg_len_temp),
    .o(msg_out)
);

// Register file

regfl #(
    .width(reg_w)
)regfile_inst(
    .clk(clk),
    .rst_b(rst_b),
    .we(st_pkt),   
    .d(msg_out),
    .s(idx),
    .q(blk)
);

// Counter for index

cntr #(
    .w(dec_w)
)counter_inst(
    .clk(clk),
    .rst_b(rst_b),
    .clr(clr),
    .c_up(st_pkt),
    .q(idx)
);

// Register for message length
reg #(.w(reg_w)) msg_len_reg(
    .clk(clk),
    .rst_b(rst_b),
    .clr(clr),
    .q(msg_len_temp),
    .ld(st_pkt & ~(pad_pkt | zero_pkt | mgln_pkt)),
    .d(msg_len)
);

endmodule