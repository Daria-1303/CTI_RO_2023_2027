# Makefile for QuestaSim Simulation

# place here the name of the testbench
TESTBENCH ?= tb_seven_segment_display
# location for the verilog files
VPATH = ./source/
# what files to delete when a make clean in called
CLEAN_FILES = transcript *~ vsim.wlf vsim.log vlog.log

# Targets
all: compile run_sim

compile: 
# Terminate any previous vsim processes
# @if [ $(shell pgrep -c -f vsimk) -ne 0 ]; then \
# 	echo "Exit vsim..."; \
# 	echo "**********************************************************"; \
# 	pkill vsim; \
# fi

# check that that work lib exists and delete if exists, or create it
	@if [ -s work ]; then \
		vdel -lib work -all; \
	else \
		echo "Work library does not exist. Creating..."; \
		echo "**********************************************************"; \
		vlib work; \
	fi

	@echo "Compiling..."
# compile verilog files -> create the vlog.log and display only ERRORS found
	@vlog -l vlog.log $(VPATH)*.v > /dev/null 2>&1 || \
	(echo "Error: Compilation failed!"; \
	echo "**********************************************************"; \
	grep "Error" vlog.log; exit 1) 
	
run_sim:
	@echo "**********************************************************"
	@echo "Running simulation..."
# run simulation in questa GUI window -> create vsim.log and display only ERRORS found
	@vsim -gui -voptargs=+acc -l vsim.log work.$(TESTBENCH) > /dev/null 2>&1 \
	|| \
	{ \
		echo "Error: Simulation failed!"; \
		echo "**********************************************************"; \
		grep "Error" vsim.log; \
		exit 1; \
	} &

clean:
	@echo "Remove project files..."
	@rm -rf work $(CLEAN_FILES)
