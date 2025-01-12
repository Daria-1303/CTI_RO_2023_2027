module cmp4b (
    input [3:0] x, y,
    output eq, lt, gt
);
    wire eq_low, eq_high, lt_high, lt_low, gt_high, gt_low;
    cmp2b inst1(.x(x[1:0]), .y(y[1:0]), .eq(eq_low), .lt(lt_low), .gt(gt_low));
    cmp2b inst2(.x(x[3:2]), .y(y[3:2]), .eq(eq_high), .lt(lt_high), .gt(gt_high));
    assign eq = eq_high & eq_low;
    assign lt = lt_high | (eq_high & lt_low);
    assign gt = gt_high | (eq_high & gt_low);
endmodule

module cmp4b_tb;
    reg [3:0] x, y; 
    wire eq, lt, gt;

    cmp4b cut (.x(x), .y(y), .eq(eq), .lt(lt), .gt(gt));

    integer k;
    initial begin
        $display("Time\tx\ty\t\teq\tlt\tgt");
        $monitor("%0t\t%b(%d)\t%b(%d)\t\t%b\t%b\t%b", $time, x, x, y, y, eq, lt, gt);
        
        for (k = 0; k < 256; k = k + 1) begin
            {x, y} = k;
            #10;
        end
    end
endmodule