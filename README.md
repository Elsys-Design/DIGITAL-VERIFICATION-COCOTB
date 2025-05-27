# Simulation Framework

This framework allows to build testbenches based on cocotb.  
It uses files to create input stimuli and output logs.  
- The main test scenario is described in a `stimuli file`. It is an array of `JSON` `Stimuli` elements giving details (about R/W access, Timing, and Data location). Is detailed in the file : [Format du fichier Stimuli](./Stimuli_Format.md)
- An additionnal `Data file` may be used to store the data to send, relative address and packet information. It's detailed in the file : [Format du fichier Data](./Data_Format.md)

## Framework evolution
This framework was first designed for Axi, AxiLite and AxiStream components but was later extended to also support OBI buses.  
Any protocol that is somewhat similar to Axi in term of usage (Wishbone, ...) may be implemented.  
The goal of this framework is only to provide a simple interface to JSON and Data files, the cocotb Drivers & Monitors
for each types of buses should be implemented in an external, general package (such as cocotbext-axi or cocotbext-obi)
(cocotbext-obi was implemented internally since it did not exist).  

## Getting started

### prerequisite
- download and install OSS-CAD-SUITE: https://github.com/YosysHQ/oss-cad-suite-build/releases/tag/2023-10-23 in folder `/opt/`
- use a linux system (or WSL for windows). Native windows was not tested
- latest xilinx vivado (to get the lastest unisim libraries otherwise you can use the one included)

### installation
we are installing python libraries inside the osscad python framework (and not the os one).
- load osscad environnement with command `source /opt/oss-cad-suite-linux-x64-20231023/oss-cad-suite/environment`
** from now on use only command found in the folder `/opt/oss-cad-suite-linux-x64-20231023/oss-cad-suite/py3bin/` for `pip` and `python`
- install cocotb axi driver with command `pip3.8 install cocotbext-axi`
- install unisim libraries in ghdl with command `/opt/oss-cad-suite-linux-x64-20231023/oss-cad-suite/lib/ghdl/vendors/compile-xilinx-vivado.sh --unisim --source ./ressources/2023.1/ --output vivado_lib`   

### execution
Prior to any use of the framework do the following lines:
- load osscad environnement with command `source /opt/oss-cad-suite-linux-x64-20231023/oss-cad-suite/environment`
- export osscad python path : `export PYTHONPATH=$(pwd)/src:$PYTHONPATH`
- export usisim path: `export UNISIM_PATH=$(pwd)/../vivado_lib/vivado_lib/unisim/v93/`
*Note* you can source `quick_setup.sh`  with command `source quick_setup.sh`

## FAQ
- Error `ImportError while loading conftest '/home/flo/FLORENT/GIT/framework_simulation_cocotb_axi/tests/conftest.py'.
conftest.py:5: in <module>`
In latest oss-cad, cocotb release version is `2.0.0beta` which is not supported right now. Please use osscad release 2023-10-23 (see [prerequisite](#prerequisite) ) 


### example
... 

### Framework tests
- Unitary tests (automatic via pytest and manual) are located in `./tests` folder. See [readme](./tests/README.md) 
- example tests are located in `./examples` folder. 


### limitations
- le framework ne supporte pas la gestion des tuser dans l'AXI stream
- le framework ne prend pas en considération la taille physique du bus AXI. Pour garantir les accès unitaires, il faut que le champ taille soit égale à la taille du bus AXI.
- Pour l'axi full/light Le framework ne gère pas le byte enable (`wstrb` pour Axi full/light) à l'intérieur des burst. Il ne gère les bytes enable que sur les accès unitaire et sur le dernier mot d'une transaction (burst ou stream). 
- Pour l'axi stream, le framework ne gère pas le byte enable `tstrb` (utilisé pour l'alignement). Il gèrerera uniquement le Tkeep utilisé pour valider un octet ou non. 
- le logger real time du framework ne gère pas les axi sans tlast. le logger par défaut supporte cela (efficient logger).
- pour gerer les asistream sana stlast il ne faut pas mapper de signal logger sur bus axistream



# License
Copyright Elsys Design
License concédée au CNES pour ses besoins propre comprennant le droit : 
- d'utilisation
- de duplication 
- de modification
- de sous licencier à un tiers (se droit n'étant pas transférable)

