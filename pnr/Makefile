# Shell setup for make
SHELL      	= /bin/bash
.SHELLFLAGS	= -o pipefail -c

# Default target when invoking without specific target.
.DEFAULT_GOAL := all

# Import the SCAD configuration
include $(SCAD_FLOW_DIR)/config.mk

# OpenROAD place and route
or_pnr:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) 

or_nuke:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) nuke

# SCAD pnr
scad_pnr:
	$(TIME_CMD) python3 $(SCAD_FLOW_DIR)/scad_pnr.py $(SCAD_ARGS)

scad_clean:
	rm -rf results

# ALL
all: or_pnr scad_pnr
clean_all: or_nuke scad_clean