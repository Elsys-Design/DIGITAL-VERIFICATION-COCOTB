# Simulation Framework cocotb_axi

This framework allows AXI light, AXI full and AXI stream testbenches based on python framework cocotb. 


## Getting started

### installation
   Installation description

### example
... 

### limitations
- le framework ne supporte pas la gestion des tuser dans l'AXI stream
- le framework ne prend pas en considération la taille physique du bus AXI. Pour garantir les accès unitaires, il faut que le champ taille soit égale à la taille du bus AXI.
- Le framework ne gère pas le byte enable (`wstrb` pour Axi full/light ou `tstrb` pour axi stream) à l'intérieur des burst et des flux AXI stream (dnas ce cas le champ `Desc` sera rempli avec le valeur de `wstrb` ). Il ne gère les bytes enable qque sur les accès unitaire et sur le dernier mot d'une transaction (burst ou stream). 

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
### Champ adresse
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

### Champ longueur
Défini la longueur effective en octets des données de la séquence.
- Supporte des tailles jusqu'à 64bits
- Est écrit en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101)   
- si la taille de la séquence est plus grande que le nombre de données écrites dans la séquence, elle sera complétée avec une stratégie 0x00, OXFF, ou random.
- si la taille de la séquence est plus petite que le nombre de données écrites dans la séquence, les lignes en supplément seront ignorée (un warning sera être affichée)
- une taille à '0' correspond à une séquence complète

### Champ type
- Le champ donnée ne supporte que le format `ASCII` pour le moment.

### Champ taille 
- Le champ indique la taille en octet des mots de données présents sur chaque ligne. 

### Champ Endianness
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
- si la taille associée à la valeur de la donnée est plus grande que celle définie dans le descripteur (un warning sera levé)
- Seule la dernière ligne de donnée d'une séquence peut contenir un point-virgule suivi d’un nombre pour indiquer le nombre d’octets à considérer (dans la donnée). Si ce champ est manquant, le mot sera considéré comme complet par rapport à la taille provenant du descripteur. 

_Note: le nombre final d'octet sur la dernière transaction d'une séquence prendra les octets en partant du LSB que la donnée soit en big ou en little endian._

- A la fin de chaque ligne de donnée, il est possible de rajouter un `;` suivi d'un séparateur de paquet pour indiquer la fin d'un paquet (tlast en AXI stream) ou la fin d'un burst (en AXI full uniquement)   
- un burst Axi Full se termine obligatoirement à la fin d'une séquence.
- un paquet Axi Stream se termine uniquement sur présence du descripteur paquet. Il est possible de commencer un paquet dans une séquence et de le finir dans la séquence suivante.

_Note: Dans le cadre d'un AXI light, tous les accès sont unitaires._   
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
@  0x00000000;31;ascii; 4; big; !; 
0x3456789A  ; 3 ; !
```

cela se traduit par l'émission ou la reception de :
- 1 paquet axistream de taille `8` avec `0x12345678` et `123` avec `tdest =0`
- 1 paquet axistream de taille `7` avec `0b110011` et `0x56789A`  avec `tdest =0`
- 1 paquet axistream de taille `19` avec `0x56789A` avec `tdest =0`  (paquet est à cheval entre la première et la deuxième séquence)
- 1 paquet axistream non finalisé avec `28` octets supplémentaires ... avec `tdest =0`

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
- 1 paquet axistream de taille `24` avec `0b110011` et `0x789A` et `17` octets supplémentaires et `0x78` avec `tdest =1`

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
- 1 burst axi full de taille `2032` commençant à l'adresse `16`avec `0b110011` et `0x9A`  et `2027` octets  
- 1 accès unitaire à l'adresse `0` avec `0x345678` 

## Analyse de fichier Data
L’analyse d’un fichier data doit pouvoir se faire de la manière suivante :
- Séparation du contenu du fichier via recherche de la balise @ (fonction python split) => identification des blocs d’adresse
- Pour chaque bloc d’adresse :
    - Séparer les données avec comme délimiteur le point-virgule (fonction python split). On doit se retrouver avec : 
        - Un champs descripteur unique (première ligne)
        - Un ou plusieurs blocs de données terminés séparés par un nombre et/ou un descripteur de fin de paquet.

# Stimuli files
- Un scénario de test est représenté par un fichier contenant un tableau d'éléments stimuli JSON.
- Ce format scénario est utilisé tant pour les stimuli de testbench que pour les moniteur de bus.
- Les élements stimuli disposent des champs suivants:
    - `ID`   : Identifie le stimuli de manière unique dans un scénario
    - `Desc` : Défini un commentaire une description sur le scénario. 
    - `Access` : Définit le type d'accès sur le bus (lecture/écriture)
    - `RelTime` : Renseigne le temps relatif entre deux stimuli.
    - `AbsTime` : Dans le cas d'un log moniteur, renseigne le temps absolue depuis le début de la simulation. 
    - `Type` : Défini la nature de la donnée de stimuli (Simple ou fichier).
    - `Data` : Dans le cas d'un accès de type Simple, il traduit la donnée lue ou à écrire.
    - `Address` : Dans le cas d'un accès de type Simple, adresse de destination ou source. 
    - `Size` : Dans le cas d'un accès de type Simple, taille du transfert en nombre d’octets.
    - `FileName` : Dans le cas d’un accès type file, chemin du fichier data source ou destination.
    - `Fill` : Dans le cas d’un accès type file, stratégie de complétion des séquences du fichiers data non complètes 
   
- Lors d'un log sur un moniteur, Les accès unitaires sur le bus seront tous traduits dans le format Simple JSON. Seul les burst seront renseignés dans des fichiers de données `Data` de type `File`.       
_Note: il n'y a aucune contrainte au niveau stimuli de testbench concernant l'utilisation du `Simple` stimuli ou de décorateur dans un fichier  `Data`_
## champ ID
- Type : `String`
- optionnel et unique dans un tableau de stimuli

Ce champ permet de référencer clairement une séquence de donnée (read/write/burst). Il devra rester concis par exemple `CONFIGURATION_S1` le champ `Desc`étant destné à acceuillir les détails.
Si ce champ est vide, le framework utilisera une valeur par défault définie par `nom du fichier stimuli sans l'extension + numéro du stimuli dans le fichier`.

## Champ Desc
- Type : `String`
- optionnel   

Ce champ donne une description ou un commentaire relatif au stimuli.

## Champ Access
- Type : `String`
- obligatoire

Défini le type d'accès éffectué (ou à effectuer sur le bus). Les choix possible sont:
- `R` :  accès lecture
- `W` : accès écriture

## Champ RelTime
- Type : `String`
- obligatoire

Donne le delta temps relatif de simulation cocotb depuis le début du scénario de stimuli (pour le premier stimuli) ou depuis le précédent stimuli (pour les suivants).   
Il adopte la notation de temps du VHDL (`fs` faisant reférence à la fento seconde):
```
    fs
    ps = 1000 fs
    ns = 1000 ps
    us = 1000 ns
    ms = 1000 us
    sec = 1000 ms
    min = 60 sec
    hr = 60 min
```   

_Note: Dans le cas d'un stimuli de testbench , le temps référencera le temps de simulation cocotb au moment ou la commande Read/write sera émise (TBC)_

_Note: Dans le cas d'un log de Moniteur , le temps référencera le temps de simulation cocotb au moment ou la data commencera à transiter sur le bus  (TBC)_

## Champ AbsTime
- Type : `String`
- obligatoire en mode log moniteur uniquement

Donne le delta temps absolu de simulation cocotb depuis le début de la simultation cocotb.
Il adopte la notation de temps du VHDL (cf `RelTime`).

_Note: Il n'est possible de référencer des stimuli de testbench avec le champ `AbsTime`_

## Champ Type
- Type : `String`
- obligatoire

Défini la nature de la donnée de stimuli. Les choix possible sont:
- `File` : données issues d’un fichier.
- `Simple` : donnée issue du présent JSON Stimuli. 

## Champ Data
- Type : `String`
- Présent et obligatoire uniquement si `Type=Simple` et `Access=W` et en stimuli testbench
- Présent et obligatoire uniquement si `Type=Simple`  et en log moniteur

Il traduit la valeur de la donnée lue ou à écrire.
- Supporte des tailles jusqu'à 64bits
- Est écrit en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101) 

_Note: La donnée est obligatoirement formatée en big endian_

## Champ Address
- Type : `String`
- Obligatoire 

Il traduit l'adresse de la donnée lue ou à écrire en mode `simple`.
Il traduit une adresse de base en mode `File`
- Supporte des tailles jusqu'à 64bits
- Est écrit en ascii dans le format:
    - hexadécimal (0x00ABCDEF)
    - entier  (12588)
    - binaire (0b11100011100101) 

_Note: dans le mode moniteur,pour un fichier,  l'adresse de base sera positionnée à l'adresse de départ du transfert car le moniteur ne peut pas déterminer l'adresse de base de l'adresse relative.   
Cela signifie que le premier décorateur data associé au fichier aura l'adresse 0._

## Champ Size
- Type : `number`
- Présent et obligatoire uniquement si `Type=Simple`

Ce nombre indique le nombre d'octets à considérer dans le transfert de la donnée `Data` en partant du LSB de celui-ci (que cela soit en little endian ou big endian).  

Dans le cas d'une écriture:   
- elle ne peut pas dépasser la taille réelle du bus AXI (sinon une erreur sera levée) 
- Pour l'AXI stream, la demande d'écriture :
    - Pour un master AXI : provoque l'activation du `TValid` (i.e. autorise l'émission des octets sur le périphérique)
    - Pour un slave AXI stream: cela lève une erreur.

Dans le cas d'une lecture:
- une taille inférieure ou égale à la taille du bus provoque:
    - un accès unitaire (AXI light ou full), 
    - l'envoie d'un paquet avec Tlast à la fin (AXI stream)
- une taille supérieure à la taille du bus provoque:
    - un accès burst (AXI full), 
    - multi-unitaire (AXI light),
    - d'un paquet avec Tlast à la fin (AXI stream)
- Pour l'AXI stream, la demande de lecture provoque:
    - Pour un slave AXI: l'activation du `Tready` (i.e. autorise la réception des octets sur le périphérique). 
    - Pour un master AXI stream: cela lève une erreur.

## Champ FileName
- Type :`String`
- Présent et obligatoire uniquement si `Type=File` et l'on est dans un stimuli de testbench

Défini le chemin avec le nom du fichier où est stocké le fichier data contenant les séquences de données.

Dans le cas d'un log de moniteur:
- A la première utilisation d'un fichier dans un scénario de plusieurs stimuli, celui ci est écrasé
- Pour un même scénario de stimuli , l'appel à un fichier précédemment utilsé provoque l'ajout de données dnas celui-ci.

## Champ Fill
- Type :`number`
- Présent et obligatoire uniquement si `Type=File` et en stimuli testbench
- type entier
    - `0` : les octets manquants pour combler la taille de la séquence seront des `0`
    - `1` : les octets manquants pour combler la taille de la séquence seront des `1`
    - `-1` : les octets manquants pour combler la taille de la séquence seront des nombre aléatoires. La graine de random sera choisie aléatoirement (supérieure strictement à 1) et loggée .
    - `i|i>1` : les octets manquants pour combler la taille de la séquence seront des nombre aléatoires. La graine de random sera le nombre `i` avec `i>1`.

Défini la stratégie à adopter pour finir les séquences de données définies dans le ficheir data (Stimuli de type `File` uniquement) si celui-ci est incomplet.   

## cas particulier des logs de moniteur
Les fichiers log moniteurs sont créer de manière informatiques. Il n'utilisent donc qu'une unique manière de faire parmis tous les paramétrages possible.   
Ce paragraphae explicite la convention associée au ficheirs logs:

- utilisation privilégiée des fichiers stimuli (accès unitaires) type `Simple`
- seul les accès burst et axi stream donnent lieu à un fichier data.
- Il n'y a qu'un seul décorateur par fichier data. Donc dans le cas de deux burst de read consécutifs, on aura deux entrée JSON et non pas 2 décorateurs dans le data.

**ID**:
- reprends le nom du moniteur en python (par exemple `MoniteurDMA`) et y rajoute un`_i` avec `i` s'incrémentant à chaque entrée JSON

**Desc**:
- A définir ultérieurement en détail
- identifie déjà les accès `wrtb` (voir paragraphe `Data` suivant)
- identifie les accès sans `tlast` (voir paragraphe `Data` suivant)

**Data**:
- on met la data en hexadécimal avec la taille du bus data (on complète donc avec des zéros)
- Dans le cas d'un accès AXI  avec un byte enable (`wstrb` pour Axi full/light ou `tstrb` pour axi stream) non continue et non aligné sur le LSB (cas gérré via la notation `; + nombre entier`), le moniteur découpera l'accès en plusieurs accès de taille 1 octet (pour les byte enable activés).
Un commentaire sera rajouter dans `Desc` pour informer que c'est le même accès initialement. Par exemple: `champ ID | wstrb = 0x81` 
- Dans le cas d'un axi stream sans `tlast`, les multiplees accès (jusqu'au `tlast` final) donneront lieu à des entrée stimuli séparrés mais pointant vers le même fichier `Filename`. 
un commentaire sera mis dans  `Desc` pour indiquer que c'est un accès sans `tlast`. 

**Address**:
- on met l’adresse complète de base dans le champ `address` du JSON stimuli.
Les fichier data aurons donc tous un décorateur avec une adresse à zero.
- on met l'adresse en hexadécimal avec la taille du bus d'adresse (on complète donc avec des zéros)

**Size**:
- géré en fonction du nombre d'octet à considérer (entier)

**AbsTime**:
- on utilise l'unité de base de la simulation cocotb (donc ça donnerait `4555888999 ns` si cocotb simule en `ns`    

**RelTime**:
-on prend la plus grande unité pouvant représenter le temps relatif avec juste 3 chiffres après la virgule. Par exemple `2.369 us` et non pas '2369 ns'

**Type**:
- utilisation de `simple` pour tous les accès unitaires 
- utilisation de `File` pour les burst (taille > taille du bus) et pour AXI stream
- Pour l'axi stream :
    - un fichier data = un paquet (jusqu'au tlast)
    - l'`adresse` est toujours à zéro (elle est dans le json)
    - la `longueur` donne la taille du paquet (attention s'il y a un accès sans tlast, le fichier sera complété et donc la taille devra être mise à jour)
    - Type sera `ascii` `hexadecimal`
    - la `taille` sera la taille du bus Axistream
    - `endianness` : big endian
    - le `!` de fin de paquet sera rajouté (il devrait être toujours à la fin du fichier sauf si le paquet n'est pas finalisé par un tlast.
    - le `nombre d'octet` additionnel à la fin sera géré.

**Filename**:
- Le répertoire de stockage pour un moniteur est le `path` de celui-ci dans la simulation (par exemple `./TB_AXIS_M1/`). 
- le nom du fichier est le nom de l'`ID` avec l'extension `dat`
- Dans le cas d'un transfert axi stream sans Tlast, le fichier gardera le nom initial (du début du transfert) et les données y seront rajoutées à la suite (sans nouveau décorateur)


## Exemple de fichier Stimuli:

En mode Simple stimuli:
```json
[
  {
    "ID":"",
    "Desc":"",
    "Access": "W",
    "RelTime":"",
    "Type": "Simple",
    "Data": "",
    "Address": "",
    "Size": "",
    "FileName":"",
    "Fill":""
  },
```

### séquence de read/write  
Stimuli: 
```json
[
  {
    "Desc":"exemple d'écriture de 4 octets 125  @0x12345678 à T=100 ps",
    "Access": "W",
    "RelTime":"100 ps",
    "Type": "Simple",
    "Data": "125",
    "Address": "0x12345678",
    "Size": "4",
  },
{
    "ID":"TEST2",
    "Desc":"exemple d'écriture de 1 octet 0xFE @305419896 à T=100,200 ns",
    "Access": "W",
    "RelTime":"100.1 ns",
    "Type": "Simple",
    "Data": "0xCAFECAFE",
    "Address": "305419896",
    "Size": "1",
  },
{
    "Access": "R",
    "RelTime":"1 ms",
    "Type": "Simple",
    "Address": "0b0",
    "Size": "4096",
  },
{
    "ID":"TEST4",
    "Desc":"exemple de lecture de 2 octets  @305419896 à T=1101,200 ns",
    "Access": "R",
    "RelTime":"1 ns",
    "Type": "Simple",
    "Address": "305419896",
    "Size": "2",
  },
    {
    "ID":"IMAGE_1",
    "Desc":"envoie d'une image",
    "Access": "W",
    "RelTime":"1 ms",
    "Type": "File",
    "FileName":"./Golden/img.lum",
    "Address": "0x10000000",
    "Fill":"0"
  }
]
```
log monitoré sur un bus AXI full 16 bits: 
```json
[
  {
    "ID":"AXIF_1",        
    "Desc":"W 2 Bytes",
    "Access": "W",
    "RelTime":"100 ps",
    "AbsTime":"100 ps",
    "Type": "Simple",
    "Data": "0x0000",
    "Address": "0x12345678",
    "Size": "2",
  },
    {
    "ID":"AXIF_2",        
    "Desc":"W 2 Bytes",
    "Access": "W",
    "RelTime":"1 ns",
    "AbsTime":"1.1 ns",
    "Type": "Simple",
    "Data": "0x007D",
    "Address": "0x1234567A",
    "Size": "2",
  },
{
    "ID":"AXIF_3",
    "Desc":"W 1 Bytes",
    "Access": "W",
    "RelTime":"100.1 ns",
    "AbsTime":"1.2001 ns",
    "Type": "Simple",
    "Data": "0x00FE",
    "Address": "0x12345678",
    "Size": "1",
  },
{
    "ID":"AXIF_4",
    "Desc":"R 1 Byte",
    "Access": "R",
    "RelTime":"1 ms",
    "AbsTime":"1000001.2001 ns",
    "Type": "File",
    "FileName": "./AXIS_45/AXIF_4.dat",
  },
  {
    "ID":"AXIF_5",
    "Desc":"R 2 Bytes",
    "Access": "R",
    "RelTime":"100 ns",
    "AbsTime":"1000101.2001 ns",
    "Type": "Simple",
    "Address": "0x12345678",
    "Data": "0xC0C0",
    "Size": "2",
  },
      {
    "ID":"AXIF_6",
    "Desc":"W 4096",
    "Access": "W",
    "RelTime":"1 ms",
    "AbsTime":"1000101.2001 ns",
    "Type": "File",
    "FileName": "./AXIS_45/AXIF_6.dat",
    "Address": "0x10000400"
  }
]
_Note: l'ordre de découpage (MSB/LSB) du premier mot en deux accès est à confirmer_


# License
Copyright Elsys Design
License concédée au CNES pour ses besoins propre comprennant le droit : 
- d'utilisation
- de dupplicaiton 
- de modification
- de sous licencier à un tiers (se droit n'étant pas transférable)

