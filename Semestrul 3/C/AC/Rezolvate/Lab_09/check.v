module check(
  input [4:0] i,
  output o
);
  /*1,5,9,13,17,21,25,29*/
  /*
   * 1: 00001
   * 5: 00101
   * 9: 01001
   * 13:01101
   * 17:10001
   */
  assign o = ((i%4) == 1) ? 1 : 0;
  //assign o = ~i[1] & i[0];  
endmodule


###4