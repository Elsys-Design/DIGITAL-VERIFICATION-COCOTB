# setup
1. create a project in vivado with axi interconnect (ATTENTION smart connect doesn't provide un-encrypted vhdl files)
  do not forget to set target files to vhdl
2. generate output modules ( per ip option)
3. go to  `<project>/<design>.gen/` folder and use command `find . -name *netlist.vhdl` to identify vivado output vhdl files.
