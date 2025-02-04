= Méthodologie et calculs avec Quantum ESPRESSO
== Préparation des fichiers 
Les fichiers de calculs sont des documents essentiels qui regroupent toutes les données d'entrée, les formules utilisées et les résultats obtenus après les calculs. Ces fichiers servent de base pour effectuer des analyses complexes, des simulations numériques, et des études statistiques. Ils permettent de modéliser des phénomènes, de tester différentes hypothèses, et d’optimiser des processus. Grâce à une gestion soignée de ces fichiers, les utilisateurs peuvent suivre et reproduire les étapes du calcul, garantissant ainsi la fiabilité et la traçabilité des résultats obtenus.

=== scf.in: Paramètres pour le calcul SCF
Le SCF (Self-Consistent Field) est une méthode de calcul itérative utilisée principalement en chimie quantique et en physique des matériaux pour résoudre les équations de Schrödinger de manière approximative. Elle permet de déterminer les fonctions d'onde et les énergies des électrons dans un système, en considérant l'interaction entre ces électrons de manière auto-cohérente, c’est-à-dire que les résultats obtenus à chaque itération servent de base pour l’itération suivante, jusqu'à convergence des solutions. Le calcul est effectué en utilisant le code ci-dessous et en exécutant la commande :  * pw.x < AlAs_scf.in > AlAs_scf.out * 
///code de scf ici
``` 
&control
calculation = 'scf'
prefix = 'AlAs'
pseudo_dir  = 'pseudos', 
/
&system
ibrav = 2
celldm(1) = 10.60
nat = 2
ntyp = 2
ecutwfc = 30.0
/
&electrons
diagonalization = 'david'
mixing_beta = 0.7
conv_thr = 1.0d-10
/
ATOMIC_SPECIES
Al 26.98 Al.pz-vbc.UPF
As 74.92 As.pz-bhs.UPF
ATOMIC_POSITIONS alat
Al 0.00 0.00 0.00
As 0.25 0.25 0.25
K_POINTS automatic
4 4 4 1 1 1 
```
/// resultat de calcule
=== nscf.in : Paramètres pour le calcul NSCF
Le NSCF (Non-Self-Consistent Field) est utilisé pour résoudre les équations de Schrödinger sans tenir compte de l'auto-cohérence des interactions électroniques, généralement pour obtenir des états excités ou des propriétés spectroscopiques.
Pour effectuer ce calcul, il est essentiel de définir un ensemble de k-points adaptés à l’objectif visé :

- Pour la structure de bandes, les k-points de haute symétrie sont sélectionnés le long des chemins caractéristiques de la zone de Brillouin, définis par la symétrie du cristal.
- Pour le DOS, une grille plus dense et uniforme de k-points est utilisée afin d’améliorer la résolution énergétique.
Ces k-points peuvent être extraits à l’aide de logiciels comme *XCrySDen*, qui permet de visualiser la structure cristalline et de générer automatiquement le chemin des points de haute symétrie en fonction du groupe cristallin du matériau. Après ça on remplace *calculation = 'scf'* par *calculation = 'nscf'* finalement on exécute la commande * pw.x < AlAs_nscf.in > AlAs_nscf.out *
///code de nscf ici
/// resultat de calcule
=== Paramètres pour la densité d’états (DOS) 
Le DOS (Density of States) est une fonction qui décrit la densité des états électroniques disponibles à différentes énergies dans un matériau, et permet d'analyser les propriétés électroniques, comme la conductivité ou l'absorption, en fonction de l'énergie. Le calcul du DOS peut être effectué en utilisant le code ci-dessous et en exécutant la commande :  * dos.x < Dos.in > Dos.out *, on trouve les resultats enregistré dans le fichier *AlAs.dos*
``` 
&DOS
    prefix = 'AlAs',
    ! otudir = '/tmp'
    fildos = 'AlAs.dos'
 /
 ```
=== Paramètres la structure de bandes (BS).
En créant un autre fichier input pour calculer  les équations de Kohn-Sham (DFT) en utilisant une base d'ondes planes et des pseudo-potentiels, on remplace *calculation = 'nscf'* par *calculation = 'bands'* et on exécute la commande * pw.x < AlAs_pw_bands.in > AlAs_pw_bands.out *. Après on crée un nouveaux fichier input avec le code ci-dessous:
```  
&BANDS
    prefix  = 'AlAs'
    ! otudir  = '/tmp/'
    filband = 'AlAs_bands.dat'
    lsym = .true.,
 /
 ```
 Finalement en exécutant la commande * bands.x < AlAs_x_bands.in > AlAs_x_bands.out * on trouve les resultats qui vont être enregistrer dans le fichier *AlAs_bands.dat*

= Résultats et Analyse
== Densité d'états (DOS)
=== Graphique de la DOS 
Le graphe de la densité d'états (DOS) montre l'évolution de la densité électronique en fonction de l'énergie. L'axe horizontal représente l'énergie (en eV), tandis que l'axe vertical représente la densité d'états. Le niveau de Fermi est situé à :

$ E_f = (E_c + E_v)/2 = (4.9153 - 0.84397)/2 = 2,879635 "eV" $
En exécutant la commande *plot'AlAs.dos' w l 2* sur *Gnuplot* on trouve le graphe ci-dessous:
#figure(
  image("Graphe de DOS.png"),
  caption: "Densité d'états en fonction de l'énergie"
)
=== Analyse du graphe : nature du matériau et largeur du gap énergétique
L’analyse de la densité d’états offre une compréhension approfondie des propriétés électroniques globales du système étudié. Si la DOS présente une région sans états électroniques autour de $E_f$​, cela indique un gap énergétique et suggère que le matériau est un semi-conducteur ou un isolant.
Si la DOS est non nulle au niveau de $E_f$​, le matériau est un conducteur.
En observant le graphe de la DOS, on peut identifier la largeur de la bande interdite ($E_g$​) en prenant la différence entre la dernière densité d'état occupée et la première densité d'état inoccupée:

$ E_g = E_c - E_v = -0.84397 + 4.91153 = 4.06756 "eV" $

On peut conclure que l’AlAs est un semi-conducteur puisque son énergie de gap n’est pas nulle (conducteur) et n’est pas de l’ordre 6 eV (isolant).

La densité d'états (DOS) est nulle au niveau de l'énergie de Fermi ($E_f$), ce qui confirme que l'AlAs est un semi-conducteur. Ce matériau présente un gap énergétique ($E_g$​), une caractéristique typique des semi-conducteurs. Le gap correspond à la région où la DOS est nulle, située entre le sommet de la bande de valence et le bas de la bande de conduction.
Pour déterminer $E_g$, il convient d’identifier :
 - Le dernier état occupé avant $E_f$​, qui correspond au sommet de la bande de valence.
 - Le premier état accessible après $E_f$​, correspondant au début de la bande de conduction.

=== Structure de Bandes (BS)
==== Graphique de la structure de bandes le long des directions de haute symétrie
Le graphe de la * structure de bandes électroniques * montre l'évolution des niveaux d'énergie en fonction du vecteur d'onde * k * le long des directions de haute symétrie dans la première zone de Brillouin.
En exécutant la commande *plot'AlAs_bands.gnu' w l 2* on trouve le graphe de structure de bande de l'AlAs ci-dessous:
#figure(
  image("Graphe de Band structure.png"),
  caption: "La structure de bandes en fonction de vecteur d'onde k"
)

==== Identification du gap énergétique (direct ou indirect)
On sait qu’un gap direct se produit si le minimum de la bande de conduction et le maximum de la bande de valence sont situés au même vecteur d'onde *k*, et un gap indirect se produit si ces extrémités sont situées à des valeurs de *k* différentes.
En analysant le graphe de la structure de bandes, il est possible d’identifier que le semi-conducteur *AlAs* possède * un gap interdite indirect *.

==== Interprétation des propriétés électroniques à partir des courbes
En fonction de la structure de bandes, Un gap direct signifie que le matériau peut être utilisé pour des applications optoélectroniques (LED, lasers…). Alors qu’un gap indirect implique une faible émission de lumière et un usage plus adapté aux composants électroniques comme les transistors, c’est le cas de l’*AlAs*.
