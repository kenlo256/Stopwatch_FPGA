transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/JKTypeFF.v}
vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/FourBitBinaryCounter.v}
vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/FiveBitBinaryCounter.v}
vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/DTypeFF.v}
vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/Comparator.v}
vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/ClockDivider50MHzTo100Hz.v}

vlog -vlog01compat -work work +incdir+C:/Temp/Stopwatch {C:/Temp/Stopwatch/ClockDivider50MHzTo100Hz_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  ClockDivider50MHzTo100Hz_tb

add wave *
view structure
view signals
run -all
