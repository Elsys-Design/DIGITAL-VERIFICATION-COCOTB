# Simulation Framework cocotb_axi

This framework allows AXI light, AXI full and AXI stream testbenches based on python framework cocotb. 


## Getting started

### installation
   Installation description

### first example


## Data format
Le fichier data contiendra :
- Un descripteur sur la nature des données identifiées par le caractère spécial `@` et dont les champs ci-dessous sont séparés par un `;` et sur une unique ligne.
    - L’adresse de base de démarrage de la séquence de données
    - la taille en octet de la séquence de donnée
    - Donnée binaire ou ascii
    - Taille des mots en nombre d’octet
    - Convention d’écriture des octets (little endian ou big endian)
    - Le descripteur de fin de paquet (utilisé pour l’axi stream). Par défaut le caractère !

- Une donnée de la taille précédemment fixée et de la nature fixée par ligne.

- Les adresses s’incrémentent en continue (la taille des mots en nombre d’octets). En cas, de « trou d’adresse » un nouveau descripteur pourra être rajouter pour identifier la nouvelle adresse de base.

- La fin d’un paquet est identifiée par un point-virgule suivi du descripteur de fin de paquet sur la même ligne que la dernière donnée.

- Le dernier mot peut contenir un point-virgule suivi d’un nombre en fin de ligne pour indiquer le nombre d’octets à considérer. Si ce champ est manquant, le mot sera considéré comme complet avec la taille provenant du descripteur.

- si la taille de la séquence est plus grande que le nombre de mot écrit dans le fichier, elle sera complétée avec une stratégie 0x00, OXFF, ou random.

- si la taille de la séquence est plus petite que le nombre de mot écrit dans le fichier, les ligne en supplément seront ignorée (une erreur pourra être affichée)

Remarques : 
- L’analyse d’un fichier data doit pouvoir se faire de la manière suivante :
    - Séparation du contenu du fichier via recherche de la balise @ (fonction python split) => identification des blocs d’adresse
    - Pour chaque bloc d’adresse :
        - Séparer les données avec comme délimiteur le point-virgule (fonction python split). On doit se retrouver avec : 
            - Un champs descripteur unique (première ligne)
            - Un ou plusieurs blocs de données terminés séparés par un nombre et/ou un descripteur de fin de paquet.
- Même si le format du descripteur est générique, dans le cadre de cette étude une seule configuration sera choisie (probablement Donnée binaire ; 4 octets ; big endian et descripteur de fin de paquet ! )


### exemple de format:

####  AXI stream
Dans le cas de l'axi stream on pourrait avoir 

```
@ ascii; 4; big; !; 0x00000000;31
0x12345678
123         ; 4 ; !
0b110011
0x3456789Ab ; 3 ; !
```
mais aussi

```
@ ascii; 4; big; !; 0x00000000;31
0x12345678
123         ; 4 ; !
0b110011
0x3456789Ab ; 2 ; 
```
et dans un autre fichier
```
@ ascii; 4; big; !; 0x00000000;1
0x12345678  ; 1 ; !
```

####  AXI Full

Dans le cas de l'axi full on pourrait avoir 
```
@ ascii; 4; big; !; 0x00000000;2048
0x12345678
123        
0b110011
0x3456789Ab ;1

@ ascii; 4; big; !; 0x00000000;3
0x12345678
```


### Stimuli files

stimuli files are JSON  formated including the following fields:
- Access : Accès type
    - Type :String
        - Read : Read accès
        - Write : accès écriture
- Type : Nature de la donnée de stimuli
    - Type :String
        - File : données issues d’un fichier. 
        - Data : donnée issue du champ data.
- Address : adresse de destination ou source. Dans le cas d’un accès multiple, les adresses se suivront de manière continue
    - type : entier sur 64 bits (décimal ou hexadécimal).
        - Data : valeur à écrire ou lire
        - type : entier sur 64 bits (décimal ou hexadécimal).
- Size : taille du transfert en nombre d’octets
    - type : entier sur 64 bits (décimal ou hexadécimal).
- File :  dans le cas d’un accès type file, la source ou la destination est le fichier identifié par le chemin 
    - Type : chemin vers un fichier
- Time : Ce champs pourra être utilisé si besoin pour renseigner le temps depuis le début de la simulation Cocotb. Le temps sera exprimé en microseconde.
    - type : flottant 

### data files





## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

