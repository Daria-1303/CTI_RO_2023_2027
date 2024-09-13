# inform quartus that the LED output port has no critical timing requirements
# its a single output port driving an LED, there are no timing relationships
# that are critical for this

set_false_path -from * -to [get_ports out]