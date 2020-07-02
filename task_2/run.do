vlog top.sv
vsim -novopt top +testname=ERROR_TEST
##vopt top +cover=fcbest -o ERROR_TEST
##vsim -coverage ERROR_TEST +testname=ERROR_TEST
##coverage save -onexit ERROR_TEST.ucdb
##add log -r sim:/top/*
do wave.do
run -all

##vsim -novopt top +testname=ERROR_TEST

##vsim -novopt top +testname=DECREMENT_TEST

