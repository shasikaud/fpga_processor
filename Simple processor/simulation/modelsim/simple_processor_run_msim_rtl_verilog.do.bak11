transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/top_control.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/register.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/PC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/processor.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/state_machine.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/core.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/iram.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/dram.v}

vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor/tb {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/tb/top_control_tb.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/core.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/state_machine.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/register.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/processor.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/PC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/iram.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/dram.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/Simple\ processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Simple processor/rom_vlog_mif.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_control_tb

add wave *
view structure
view signals
run -all
