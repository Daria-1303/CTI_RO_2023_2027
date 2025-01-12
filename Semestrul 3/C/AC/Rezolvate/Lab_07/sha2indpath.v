module sha2indpath(
  input clk,rst_b,clr,st_pkt,pad_pkt,zero_pkt,mgln_pkt,
  input [63:0] pkt,
  output [2:0] idx,
  output [511:0] blk
);
  wire [63:0] mlen, mout;
  pktmux inst1(.pkt(pkt),.pad_pkt(pad_pkt),.zero_pkt(zero_pkt),
      .mgln_pkt(mgln_pkt),.msg_len(mlen),.o(mout));

  regfl inst2(.clk(clk),.rst_b(rst_b),.we(st_pkt),.d(mout),
      .s(idx),.q(blk));

  cntr #(.w(3)) inst3(.clk(clk),.rst_b(rst_b),.clr(clr),.c_up(st_pkt),.q(idx));

  rgst #(.w(64)) inst4(.clk(clk),.rst_b(rst_b),.clr(clr),.q(mlen),
      .ld(st_pkt&(~(pad_pkt|zero_pkt|mgln_pkt))),
      .d(mlen+64));

endmodule

module sha2indpath_tb;
  reg clk,rst_b,clr,st_pkt,pad_pkt,zero_pkt,mgln_pkt;
  reg [63:0] pkt;
  wire [2:0] idx;
  wire [511:0] blk;
  
  sha2indpath inst1(.clk(clk),.rst_b(rst_b),.clr(clr),.st_pkt(st_pkt),
      .pad_pkt(pad_pkt),.zero_pkt(zero_pkt),.mgln_pkt(mgln_pkt),
      .pkt(pkt),.idx(idx),.blk(blk));
endmodule

module sha2indpath_tb;
	reg [63:0] pkt;
	reg clk, rst_b, st_pkt, clr, pad_pkt, zero_pkt, mgln_pkt;
	wire [2:0] idx;
	wire [511:0] blk;

	sha2indpath #(
		.reg_w(64),
		.reg_cnt(8),
		.dec_w(3)
	)
	dut(
		.clk(clk),
		.rst_b(rst_b),
		.pkt(pkt),
		.st_pkt(st_pkt),
		.clr(clr),
		.pad_pkt(pad_pkt),
		.zero_pkt(zero_pkt),
		.mgln_pkt(mgln_pkt),
		.idx(idx),
		.blk(blk)
	);

	task urand64(output reg [63:0] r);
		begin
			r[63:32] = $urandom;
			r[31:0] = $urandom;
		end
	endtask

	localparam CLK_PERIOD = 100;
	localparam RUNNING_CYCLES = 13;
	initial begin
		repeat (RUNNING_CYCLES) #(CLK_PERIOD) urand64(pkt);
	end

	initial begin
		clk = 1'b0;
		repeat (2 * RUNNING_CYCLES) #(CLK_PERIOD / 2) clk = ~clk;
	end

	localparam RST_DURATION = 5;
	initial begin
		rst_b =  1'b0;
		#RST_DURATION rst_b = 1'b1;
	end

	initial begin

		$display("st_pkt | clr | pad_pkt | zero_pkt | mgln_pkt | pkt | idx | blk");
		$display("-----------------------------------------------------------------------------");
		$monitor("%d | %d | %d | %d | %d | %h | %h | %h", st_pkt, clr, pad_pkt, zero_pkt, mgln_pkt, pkt, idx, blk);

		clr = 1'b0;
		st_pkt = 1'b1;
		pad_pkt = 1'b0;
		zero_pkt = 1'b0;
		mgln_pkt = 1'b0;
		urand64(pkt);

		#(2 * CLK_PERIOD)
		clr = 1'b1;

		#(CLK_PERIOD)
		clr = 1'b0;

		#(5 * CLK_PERIOD)
		st_pkt = 1'b0;
		
		#(CLK_PERIOD)
		st_pkt = 1'b1;
		
		#(CLK_PERIOD)
		pad_pkt = 1'b1;

		#(CLK_PERIOD)
		pad_pkt = 1'b0;
		zero_pkt = 1'b1;

		#(CLK_PERIOD)
		zero_pkt = 1'b0;
		mgln_pkt = 1'b1;

		#(CLK_PERIOD)
		mgln_pkt = 1'b0;
	end
endmodule