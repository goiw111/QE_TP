= Méthodologie et calculs avec Quantum ESPRESSO
== Préparation des fichiers 
Les fichiers de calculs sont des documents essentiels qui regroupent toutes les données d'entrée, les formules utilisées et les résultats obtenus après les calculs. Ces fichiers servent de base pour effectuer des analyses complexes, des simulations numériques, et des études statistiques. Ils permettent de modéliser des phénomènes, de tester différentes hypothèses, et d’optimiser des processus. Grâce à une gestion soignée de ces fichiers, les utilisateurs peuvent suivre et reproduire les étapes du calcul, garantissant ainsi la fiabilité et la traçabilité des résultats obtenus.

=== scf.in: Paramètres pour le calcul SCF
Le SCF (Self-Consistent Field) est une méthode de calcul itérative utilisée principalement en chimie quantique et en physique des matériaux pour résoudre les équations de Schrödinger de manière approximative. Elle permet de déterminer les fonctions d'onde et les énergies des électrons dans un système, en considérant l'interaction entre ces électrons de manière auto-cohérente, c’est-à-dire que les résultats obtenus à chaque itération servent de base pour l’itération suivante, jusqu'à convergence des solutions.
///code de scf ici
/// resultat de calcule
=== nscf.in : Paramètres pour le calcul NSCF
Le NSCF (Non-Self-Consistent Field) est utilisé pour résoudre les équations de Schrödinger sans tenir compte de l'auto-cohérence des interactions électroniques, généralement pour obtenir des états excités ou des propriétés spectroscopiques:
///code de nscf ici
/// resultat de calcule
=== Paramètres pour la densité d’états (DOS) 
Le DOS (Density of States) est une fonction qui décrit la densité des états électroniques disponibles à différentes énergies dans un matériau, et permet d'analyser les propriétés électroniques, comme la conductivité ou l'absorption, en fonction de l'énergie. Le calcul du DOS peut être effectué en utilisant le code ci-dessous et en exécutant la commande :  * dos.x < Dos.in > Dos.out *
=== Paramètres la structure de bandes (BS).

= Résultats et Analyse
== Densité d'états (DOS)
=== Graphique de la DOS 
Le graphe de la densité d'états (DOS) montre l'évolution de la densité électronique en fonction de l'énergie. L'axe horizontal représente l'énergie (en eV), tandis que l'axe vertical représente la densité d'états. Le niveau de Fermi est situé à :

$ E_f = (E_c + E_v)/2 = (-4.9153 - 0.84397)/2 = 2,879635 "eV" $

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

== Structure de Bandes (BS)
=== Graphique de la structure de bandes le long des directions de haute symétrie
Le graphe de la * structure de bandes électroniques * montre l'évolution des niveaux d'énergie en fonction du vecteur d'onde * k * le long des directions de haute symétrie dans la première zone de Brillouin.

#figure(
  image("Graphe de Band structure.png"),
  caption: "La structure de bandes en fonction de vecteur d'onde k"
)

=== Identification du gap énergétique (direct ou indirect)
On sait qu’un gap direct se produit si le minimum de la bande de conduction et le maximum de la bande de valence sont situés au même vecteur d'onde *k*, et un gap indirect se produit si ces extrémités sont situées à des valeurs de *k* différentes.
En analysant le graphe de la structure de bandes, il est possible d’identifier que le semi-conducteur *AlAs* possède * un gap interdite indirect *.

=== Interprétation des propriétés électroniques à partir des courbes
En fonction de la structure de bandes, Un gap direct signifie que le matériau peut être utilisé pour des applications optoélectroniques (LED, lasers…). Alors qu’un gap indirect implique une faible émission de lumière et un usage plus adapté aux composants électroniques comme les transistors, c’est le cas de l’*AlAs*.
