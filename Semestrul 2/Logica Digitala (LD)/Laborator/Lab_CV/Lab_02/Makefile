# Makefile for QuestaSim Simulation

VSIM = vsim
WORK_DIR = work
DO_SIM = run_sim.do
DO_PATH = ./source/do_files/

run_sim:
	$(VSIM) -do $(DO_PATH)$(DO_SIM)

clean:
	# Remove generated files
	rm -rf $(WORK_DIR) transcript *~ vsim.wlf vsim.log vlog.log
