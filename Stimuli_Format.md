# Format du fichier Stimuli
The docmument décrit en détail le format du fichier de type Stimuli.

 Un scénario de test est représenté par un fichier contenant un tableau d'éléments stimuli JSON.
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

_Note: il n'y a aucune contrainte au niveau stimuli de testbench concernant l'utilisation du `Simple` stimuli ou de décorateur dans un fichier  `Data`_   
_Note: Pour les bus Axistream, il faudra surveiller qu'il n'y ai que des accès `write` pour les master (émission sur le bus) et des accès `Read` pour les slaves (autorisation de réception sur le bus)._   

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
- identifie déjà les accès byte `wstrb` ou `tkeep` (voir paragraphe `Data` suivant)
- identifie les accès sans `tlast` (voir paragraphe `Data` suivant)

**Data**:
- on met la data en hexadécimal avec la taille du bus data (on complète donc avec des zéros)
- Dans le cas d'un accès AXI  avec un byte enable (`wstrb` pour Axi full/light ou `tkeep` pour axi stream) non continue et non aligné sur le LSB (cas gérré via la notation `; + nombre entier`), le moniteur découpera l'accès en plusieurs accès de taille 1 octet (pour les byte enable activés).
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
```
_Note: l'ordre de découpage (MSB/LSB) du premier mot en deux accès est à confirmer_