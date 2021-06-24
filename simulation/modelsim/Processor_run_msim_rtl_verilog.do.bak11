transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/datapath.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/memory_ip.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/Register.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/Processor.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/PC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/AC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/IR.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/ALU.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/BUS.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/Control_Unit.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/state_machine.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/top_layer.v}

vlog -vlog01compat -work work +incdir+E:/GIthub/prc/tb {E:/GIthub/prc/tb/test_tb2.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/AC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/ALU.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/IR.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/datapath.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/BUS.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/memory_ip.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/PC.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/state_machine.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/Register.v}
vlog -vlog01compat -work work +incdir+E:/GIthub/prc {E:/GIthub/prc/Processor.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_tb2

add wave *
view structure
view signals
run -all
