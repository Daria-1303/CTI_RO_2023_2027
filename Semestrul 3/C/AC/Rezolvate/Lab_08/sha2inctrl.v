module sha2inctrl(
  input clk,rst_b,lst_pkt,
  input [2:0] idx,
  output reg st_pkt,pad_pkt,
  output reg zero_pkt,mgln_pkt,
  output reg blk_val,msg_end
);
  localparam START=0,RX_PKT=1,PAD=2,ZERO=3,MGLN=4,MSG_END=5,STOP=6;
  reg [2:0] st,st_nxt;

  always @ (*)
    case(st)
      START,RX_PKT: if (lst_pkt == 0)             st_nxt=RX_PKT;
                    else                          st_nxt=PAD;
      PAD,ZERO:     if (idx == 7)                 st_nxt=MGLN;
                    else                          st_nxt=ZERO;
      MGLN:                                       st_nxt=MSG_END;
      MSG_END,STOP:                               st_nxt=STOP;
    endcase
  always @ (*) begin
    blk_val=0;
    msg_end=0;
    st_pkt=0;
    pad_pkt=0;
    zero_pkt=0;
    mgln_pkt=0;
    case(st)
      START: begin
        st_pkt=1; end
      RX_PKT: begin
        st_pkt=1;
        if (idx == 0)
          blk_val=1; end
      PAD: begin
        st_pkt=1;
        pad_pkt=1;
        if (idx == 0)
          blk_val=1; end
      ZERO: begin
        st_pkt=1;
        zero_pkt=1; end
      MGLN: begin
        st_pkt=1;
        mgln_pkt=1; end
      MSG_END: begin
        blk_val=1;
        msg_end=1; end
    endcase
  end
  always @ (posedge clk, negedge rst_b)
    if (rst_b == 0)                                 st<=START;
    else                                            st<=st_nxt;
endmodule