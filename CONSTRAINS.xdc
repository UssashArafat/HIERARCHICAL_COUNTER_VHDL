#######################################################################################
# Company: CSUN
# Semester: FALL 2020
# Course: ECE524
# Designer: Ussash Arafat

# Project Name: LAB_01
# Design Name: CONSTAINTS
#              (This .XDC file contains all the constrain required for lab 1) 
#######################################################################################


# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y9 [get_ports {CLOCK}];


# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN T22 [get_ports {OUTPUT(0)}];
set_property PACKAGE_PIN T21 [get_ports {OUTPUT(1)}];
set_property PACKAGE_PIN U22 [get_ports {OUTPUT(2)}];
set_property PACKAGE_PIN U21 [get_ports {OUTPUT(3)}];
set_property PACKAGE_PIN V22 [get_ports {OUTPUT(4)}];
set_property PACKAGE_PIN W22 [get_ports {OUTPUT(5)}];
set_property PACKAGE_PIN U19 [get_ports {OUTPUT(6)}];
set_property PACKAGE_PIN U14 [get_ports {OUTPUT(7)}]; 


# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN P16 [get_ports {RESET}];
set_property PACKAGE_PIN R16 [get_ports {PAUSE}];
set_property PACKAGE_PIN N15 [get_ports {DIRECTION}];


# ----------------------------------------------------------------------------
# User DIP Switches - Bank 35
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN F22 [get_ports {CONTROL(0)}];
set_property PACKAGE_PIN G22 [get_ports {CONTROL(1)}];
set_property PACKAGE_PIN H22 [get_ports {CONTROL(2)}];


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are 
# evaluated prior to other PACKAGE_PIN constraints being applied, then 
# the IOSTANDARD specified will likely not be applied properly to those 
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed 
# within the XDC file in a location that is evaluated AFTER all 
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ---------------------------------------------------------------------------- 

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
