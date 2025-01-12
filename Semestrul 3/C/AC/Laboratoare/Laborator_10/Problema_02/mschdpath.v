module mschdpath(
	input clk,
	input rst_b,
	input ld_mreg,
	input upd_mreg,
	input [511 : 0] blk,	//blocul de informatii
	output [31:0] m0
);

wire [31 : 0] mux_input [15 :0]; // 16 registre de 32 de biti -> intrarile in multiplexoare

wire [31 : 0] mux_output [15 : 0]; // iesirile multiplexoarelor

wire [31 : 0] sigma0_output;
wire [31 : 0] sigma1_output;

genvar i;

generate
	for(i = 0; i < 16; i = i + 1) begin
		if(i == 0) begin
			mux #(.width(32)) mux0 (
				.i1(blk[511:480]),
				.i0(mux_input[1]),
				.s(ld_reg),
				.o(mux_output[0])
			);
			
			rgst #(.width(32)) rgst0 (
				.clk(clk),
				.rst_b(rst_b),
				.clr(1'b0),
				.ld(upd_mreg),
				.data(mux_output[0]),
				.q(m0)
			);
		end


		else if(i == 1) begin
			mux #(.width(32)) mux1 (
				.i1(blk[479:448]),
				.i0(mux_input[2]),
				.s(ld_reg),
				.o(mux_output[1])
			);
			
			rgst #(.width(32)) rgst0 (
				.clk(clk),
				.rst_b(rst_b),
				.clr(1'b0),
				.ld(upd_mreg),
				.data(mux_output[1]),
				.q(mux_input[1])
			);
			
			sigma0 SIGMA0 (
				.in(mux_input[1]),
				.out(sigma0_output)
				);
		end

		else if(i == 14) begin
			mux #(.width(32)) mux14 (
				.i1(blk[63:32]),
				.i0(mux_input[15]),
				.s(ld_reg),
				.o(mux_output[14])
			);
			
			rgst #(.width(32)) rgst14 (
				.clk(clk),
				.rst_b(rst_b),
				.clr(1'b0),
				.ld(upd_mreg),
				.data(mux_output[14]),
				.q(mux_input[14])
			);

			sigma1 SIGMA1 (
				.in(mux_input[14]),
				.out(sigma1_output)
				);
		end

		else if(i == 15) begin
			mux #(.width(32)) mux15 (
				.i1(blk[31:0]),
				.i0(m0 + sigma0_output + sigma1_output + mux_input[9]),
				.s(ld_reg),
				.o(mux_output[15])
			);
			
			rgst #(.width(32)) rgst15 (
				.clk(clk),
				.rst_b(rst_b),
				.clr(1'b0),
				.ld(upd_mreg),
				.data(mux_output[15]),
				.q(mux_input[15])
			);
		end

		else begin
			mux #(.width(32)) mux (
				.i1(blk[511 - i * 32 : 480 - i * 32]),
				.i0(mux_input[i + 1]),
				.s(ld_reg),
				.o(mux_output[i])
			);
			
			rgst #(.width(32)) rgst15 (
				.clk(clk),
				.rst_b(rst_b),
				.clr(1'b0),
				.ld(upd_mreg),
				.data(mux_output[i]),
				.q(mux_input[i])
			);
		end	
	end
endgenerate

endmodule

module tb_mschdpath;
reg clk;
reg rst_b;
reg ld_mreg;
reg upd_mreg;
reg [511 : 0] blk;
wire [31 : 0] m0;

mschdpath instantiere(
	.clk(clk),
	.rst_b(rst_b),
	.ld_mreg(ld_mreg),
	.upd_mreg(upd_mreg),
	.blk(blk),
	.m0(m0)
);

initial begin
	clk = 0;
	rst_b = 0;
	ld_mreg = 1;
	upd_mreg = 0;
	blk = 512'h6162636430313233800000040;
end

integer i;

initial begin 
	for(i = 1; i <= 128; i = i + 1) begin
		#50;
		clk = ~clk;
	end
end

initial begin 
	#25;
	rst_b = 1;
end

initial begin
	#100;
	ld_mreg = 0;
end

endmodule
