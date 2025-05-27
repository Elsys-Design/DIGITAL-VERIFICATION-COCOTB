# setup
1. create a project in vivado with axi interconnect (ATTENTION smart connect doesn't provide un-encrypted vhdl files)
  do not forget to set target files to vhdl
2. generate output modules ( per ip option is okay)
3. go to  `<project>/<design>.gen/` folder and use command `find . -name *netlist.vhdl` to identify vivado output vhdl files and put them in `. ./src` folder
4. remplace your ip to test from netlist to original vhdl files (in our case `axilite2ipic.vhd` )

* This use cae is documented and origintaed from https://gitlab.cnes.fr/dso-tb-et/fpga_ip/ip/cnes/axilite2ipic*