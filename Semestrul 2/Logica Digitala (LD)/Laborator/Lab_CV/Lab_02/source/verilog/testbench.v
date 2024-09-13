module testbench();

    //Inputs
    reg in1;
    reg in2;
    reg in3;

    //Outputs
    wire out;

    mj_voter DUT(
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out(out)
    );

    initial begin
        //initilize
        in1 = 0;
        in2 = 0;
        in3 = 0;

        #100;
    end

    always begin
        #25 in1 = ~in1;
        #50 in2 = ~in2;
        #75 in3 = ~in3;
    end
endmodule