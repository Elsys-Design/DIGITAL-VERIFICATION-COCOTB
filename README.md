# Simulation Framework cocotb_axi

This framework allows AXI light, AXI full and AXI stream testbenches based on python framework cocotb. 


## Getting started

### installation
   Installation description

### example
... 

# Data File format
Le fichier data contiendra une ou plusieurs séquences définies par:   

- Un descripteur sur la nature des données identifiées par le caractère spécial `@` et dont les champs ci-dessous sont séparés par un `;` et sur une unique ligne:
    - **Adresse** : Adresse de démarrage de la séquence de données
    - **Longueur** : Taille en octet de la séquence de donnée à utiliser
    - **Type** : Type de donnée : `binaire` ou `ascii`.
    - **Taille** : Taille en octet des mots de donnée.
    - **Endianness** : Convention d’écriture des octets (little endian `Little` ou big endian `Big`) 
    - **Paquet** : Descripteur de fin de paquet ou de burst.

- Une ou plusieurs données de la taille et du type fixé, par ligne.   

## Descripteur 
### champ adresse
Il donne l'adresse de début de la séquence.
- Supporte des adresses jusqu'à 64bits
- Est écrit en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101)
- supporte les accès non alignés avec la taille du bus
- Doit être aligné avec la taille du mot
- S’incrémentent en continue (de la taille des mots en nombre d’octets) dans le cas Axi Full et light
- Est utilisé comme `Tdest` dans le cas Axi Stream et donc ne s'incrémente pas.

_Note: En cas, de « trou d’adresse » une nouvelle séquence pourra être rajouter pour identifier la nouvelle adresse de départ._   
_Note: Une bonne pratique sera que l'adresse des séquences dans ces fichiers sera une adresse relative par rapport à une adresse de base renseignée à un étage au dessus (fichier Stim) . Si l'on veut renseigner une addresse absolue dans le fichier data, il faudra penser à mettre l'adresse de base dans le fichier stim à 0._

### champ longueur
Défini la longueur effective en octets des données de la séquence.
- Supporte des tailles jusqu'à 64bits
- Est écrit en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101)   
- si la taille de la séquence est plus grande que le nombre de données écrites dans la séquence, elle sera complétée avec une stratégie 0x00, OXFF, ou random.
- si la taille de la séquence est plus petite que le nombre de données écrites dans la séquence, les lignes en supplément seront ignorée (une erreur pourra être affichée)

### champ type
- Le champ donnée ne supporte que le format `ASCII` pour le moment.

### champ taille 
- Le champ indique la taille en octet des mots de données présents sur chaque ligne. 

### champ Endianness
- Le champs endianness ne supporte que le format Big endian ( `Big`) pour le moment

### Descripteur champ Paquet
- Le paquet donnée ne supporte que `!` pour le moment. 

## Données
Il y a une donnée par ligne. La taille de chaque donnée considérée est fixée par le champs taille.
- Supporte des tailles jusqu'à 64bits
- Est écrite en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101)   
- Seule la dernière ligne de donnée d'une séquence peut contenir un point-virgule suivi d’un nombre pour indiquer le nombre d’octets à considérer (dans la donnée). Si ce champ est manquant, le mot sera considéré comme complet par rapport à la taille provenant du descripteur. 

_Note: le nombre final d'octet sur la dernière transaction d'une séquence prendra les octets en partant MSB si la donnée est en big endian et lsb si la donnée est en little._

- A la fin de chaque ligne de donnée, il est possible de rajouter un `;` suivi d'un séparateur de paquet pour indiquer la fin d'un paquet (tlast en AXI stream) ou la fin d'un burst (en AXI full uniquement)   
- un burst Axi Full se termine obligatoirement à la fin d'une séquence.
- un paquet Axi Stream se termine uniquement sur présence du descripteur paquet. Il est possible de commencer un paquet dans une séquence et de le finir dans la séquence suivante.

_Note: Dans le cadre d'un AXI light , tous les accès sont unitaires._
_Note: Dans le cadre d'un AXI full, les données sont en burst dès lors que les données à écrire sont supérieures à la taille du bus. Pour faire des accès unitaires, il faut mettre le séparateur de paquet à la fin de chaque ligne de donnée._

## Exemple de fichier data:

###  AXI stream
Dans le cas de l'axi stream on pourrait avoir :

```
@  0x00000000;31;ascii; 4; big; !; 
0x12345678
123         ; !
0b110011
0x3456789A  ; 3 ; !
```
```
@  0x00000000;31;ascii; 3; big; !; 
0x3456789A  ; 3 ; !
```

cela se traduit par l'émission ou la reception de :
- 1 paquet axistream de taille 8 avec `0x12345678` et `123` avec `tdest =0`
- 1 paquet axistream de taille 7 avec `0b110011` et `0x345678`  avec `tdest =0`
- 1 paquet axistream non finalisé avec `0x345678` et `28` octets supplémentaires ... avec `tdest =0`

mais aussi

```
@ 1 ; 31 ; ascii; 4; big; !;
0x12345678
123         ;  !
0b110011
0x3456789A ; 2 ; 
```
et dans un autre fichier
```
@  1; 1; ascii; 4; big; !;
0x12345678  ; 1 ; !
```
cela se traduit par l'émission ou la reception de :
- 1 paquet axistream de taille `8` avec `0x12345678` et `123` avec `tdest =1`
- 1 paquet axistream de taille `25` avec `0b110011` et `0x3456` et `18` octets supplémentaires et `0x12` avec `tdest =1`

###  AXI Full

Dans le cas de l'axi full on pourrait avoir 
```
@ 0x00000000 ; 2048 ; ascii; 4; big; !; 
0x12345678
123   ; !     
0b110011
0x3456789A ;1

@ 0x00000000;3; ascii; 4; big; !; 
0x12345678
```
cela se traduit par l'émission ou la reception de :
- 1 burst axi full de taille `16` commençant à l'adresse `0`avec `0x12345678` et `123` 
- 1 burst axi full de taille `2032` commençant à l'adresse `16`avec `0b110011` et `0x34`  et `2027` octets  
- 1 accès unitaire à l'adresse `0` avec `0x123456` 

## Analyse de fichier Data
L’analyse d’un fichier data doit pouvoir se faire de la manière suivante :
- Séparation du contenu du fichier via recherche de la balise @ (fonction python split) => identification des blocs d’adresse
- Pour chaque bloc d’adresse :
    - Séparer les données avec comme délimiteur le point-virgule (fonction python split). On doit se retrouver avec : 
        - Un champs descripteur unique (première ligne)
        - Un ou plusieurs blocs de données terminés séparés par un nombre et/ou un descripteur de fin de paquet.



# Stimuli files

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



## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

