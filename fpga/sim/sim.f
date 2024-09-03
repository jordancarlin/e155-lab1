-L work
-reflib pmi_work
-reflib ovi_ice40up


"/home/jcarlin/e155/e155-lab1/fpga/radiant_project/e155_lab1/source/impl_1/lab1_jc.sv" 
"/home/jcarlin/e155/e155-lab1/fpga/src/top.sv" 
"/home/jcarlin/e155/e155-lab1/fpga/src/pulse.sv" 
"/home/jcarlin/e155/e155-lab1/fpga/src/seg_decoder.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_jc
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
