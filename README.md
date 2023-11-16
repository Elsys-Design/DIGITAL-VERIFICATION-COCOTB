# Simulation Framework cocotb_axi

This framework allows AXI light, AXI full and AXI stream testbenches based on python framework cocotb. 
It uses files to create input stimuli and output logs.    
- The main AXI test scenario is describes in a `stimuli file`. It is an array of `JSON` `Stimuli` elements giving details (about R/W access, Timing, and Data location). Is detailed in the file : [Format du fichier Stimuli](./Stimuli_Format.md)
- Additionnal `Data file`  storing data to sent, relative address and packet information. Is detailed in the file : [Format du fichier Data](./Data_Format.md)

## Getting started

### installation
   Installation description

### example
... 

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

