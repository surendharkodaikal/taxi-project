onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/clk
add wave -noupdate /top/rst
add wave -noupdate /top/dut/INCR
add wave -noupdate /top/dut/DECR
add wave -noupdate /top/dut/ERROR
add wave -noupdate /top/dut/STABLE
add wave -noupdate /top/dut/clk
add wave -noupdate /top/dut/rst
add wave -noupdate /top/dut/in
add wave -noupdate /top/dut/incr_decr_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {525 ns}
