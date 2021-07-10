transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/datapath.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/memory_ip.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Register.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Processor.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/PC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/AC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/IR.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/BUS.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Control_Unit.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/state_machine.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/top_layer.v}

vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor/tb {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/tb/test_tb2.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/AC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/IR.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/datapath.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/BUS.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/memory_ip.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/PC.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/state_machine.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Register.v}
vlog -vlog01compat -work work +incdir+D:/Academics/FPGA\ Processor\ Project/GitHub/fpga_processor {D:/Academics/FPGA Processor Project/GitHub/fpga_processor/Processor.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_tb2

add wave *
view structure
view signals
run -all
