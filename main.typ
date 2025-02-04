#import "@preview/red-agora:0.1.1": project
#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/finite:0.4.1": automaton
#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge
#show: codly-init.with()
#set math.equation(numbering: "(eq_1)")

#show: project.with(
  title: "Étude des Propriétés Électroniques de l'Arséniure d'Aluminium (AlAs) à l'aide de Quantum ESPRESSO",
  subtitle: "TP : Physique des semi-conducteur",
  authors: ("Fatema Khay-Ali", "Salma Ettaoumy", "souhail chahmout","omar mansori", "Badr Es-sabbaby"),
  mentors: ("PR. RFIFI SAAD","Dr. Serifi Ilias"),
  branch: "GESE",
  academic-year: "2024-2025",
  french: true,
  school-logo: image("logo-TR-2-1.png"),
  footer-text: "FPL"
)

///// badr

= Introduction

Les semiconducteurs constituent le pilier technologique de l’ère moderne, sous-
tendant des avancées révolutionnaires en électronique, optoélectronique, énergie
renouvelable et nanotechnologie. Leur conductivité électrique ajustable — située
entre celle des isolants et des métaux — en fait des matériaux polyvalents pour des
dispositifs tels que les transistors à effet de champ, les cellules photovoltaïques,
les LED (diodes électroluminescentes) et les capteurs quantiques. Parmi ces
matériaux, les composés III-V (combinant un élément du groupe III, comme
l’aluminium, et un élément du groupe V, comme l’arsenic) se démarquent par leurs
propriétés électroniques supérieures.

L’arséniure d’aluminium (AlAs), un composé III-V à structure cristalline zinc-
blende, illustre parfaitement ces avantages. Il possède une bande interdite
indirecte (environ 2.1 eV), une haute mobilité électronique et une excellente
stabilité thermique, ce qui le rend compatible avec des structures hétérogènes
comme les hétérojonctions AlAs/GaAs, utilisées dans les lasers et les transistors
haute fréquence. Cependant, ses applications dépendent étroitement de ses
propriétés électroniques intrinsèques :

- La structure de bande détermine la capacité du matériau à absorber ou
émettre de la lumière.
- La densité d’états (DOS) révèle la distribution énergétique des électrons,
influençant la conductivité.
- La mobilité des porteurs de charge conditionne la rapidité des dispositifs
électroniques.

L’étude approfondie de ces propriétés est donc essentielle pour optimiser les
performances des dispositifs existants et en concevoir de nouveaux. Par exemple,
dans les cellules photovoltaïques à couches minces, une bande interdite indirecte
peut limiter l’absorption de la lumière visible, nécessitant des stratégies d’ingénierie
de bande pour améliorer l’efficacité.

== Présentation de Quantum ESPRESSO comme outil de calcul

Quantum ESPRESSO est une suite logicielle open source de référence pour la
modélisation ab initio des matériaux, basée sur la théorie de la fonctionnelle de la
densité (DFT). Cette approche, récompensée par un prix Nobel, permet de résoudre
les équations de la mécanique quantique pour des systèmes à N corps, enapproximant les interactions électron-électron via une fonctionnelle d’échange-
corrélation.


*Fonctionnalités clés*
  - Précision et flexibilité :
    - Utilisation de pseudopotentiels pour modéliser les électrons de cœur et de valence séparément, réduisant les coûts de calcul.
    - Prise en charge de matériaux complexes (cristaux, surfaces, défauts ponctuels).
  - Modules spécialisés :
    - SCF (Self-Consistent Field) : Calcul itératif de la densité électronique jusqu’à convergence.
    - NSCF (Non-Self-Consistent Field) : Calcul des propriétés électroniques sur une grille de points k dense.
    - DOS (Density of States) : Génération de la densité d’états pour identifier les bandes de valence et de conduction.
    - Bands (Band Structure) : Cartographie de la dispersion énergétique des électrons dans la zone de Brillouin.
  - Visualisation intégrée :
    - Outils comme pw.x, dos.x, et bands.x pour générer des graphiques exploitables (ex. bandes énergétiques, DOS). 

*Pourquoi Quantum ESPRESSO pour AlAs ?*

AlAs présente une complexité due à sa bande interdite indirecte et à ses
interactions électroniques fortes. Quantum ESPRESSO, avec ses fonctionnelles
avancées (ex. PBEsol, HSE), permet de capturer ces effets avec une grande fidélité,
contrairement à des méthodes semi-empiriques moins précises.

== Objectifs du TP

Ce travail pratique vise à caractériser les propriétés électroniques de l’AlAs en
combinant simulations DFT et analyse critique des résultats. Les objectifs se déclinent en deux axes :

=== Réaliser les calculs SCF, NSCF, DOS et BS

1. Calcul SCF :
  - Initialiser la structure cristalline de l’AlAs (paramètres de maille, positions atomiques).
  - Définir les paramètres de calcul : énergie de coupure (cutoff), grille de points k, fonctionnelle d’échange-corrélation (ex. PBEsol).
  - Atteindre la convergence de la densité électronique (critère : variation d’énergie < 1e-6 Ry).
2. Calcul NSCF :
  - Utiliser la densité électronique convergée du SCF.
  - Augmenter la densité de la grille k (ex. 12x12x12) pour améliorer la précision des calculs de DOS et de bandes.
3. Densité d’états (DOS) :
  - Générer la DOS à l’aide du module dos.x.
  - Identifier les pics de densité correspondant aux bandes de valence (proches de -5 eV à 0 eV) et de conduction (au-dessus de 2.1 eV).
4. Structure de bande (BS) :
  - Tracer la dispersion énergétique le long des chemins de haute symétrie (ex. Γ → X → L → Γ).
  - Déterminer la nature de la bande interdite (indirecte : minimum de conduction en X, maximum de valence en Γ).

=== Interpréter les propriétés électroniques du matériau étudié
- Bande interdite indirecte :
  - Comparaison avec des matériaux à bande interdite directe (ex. GaAs).
  - Implications pour l’absorption lumineuse : nécessité de phonons pour les transitions indirectes, réduisant l’efficacité optique.
- Analyse de la DOS : 
  - Contributions orbitales : dominance des orbitales p de l’arsenic dans la bande de valence et des orbitales s de l’aluminium dans la bande de conduction.
  - Pic de Van Hove : présence de singularités dans la DOS, indicatrices de fortes interactions électroniques.
- Applications technologiques :
  - Électronique haute fréquence : Exploitation de la haute mobilité électronique pour les transistors HEMT (High Electron Mobility Transistors).
  - Hétérostructures : Utilisation en combinaison avec GaAs pour des puces quantiques ou des photodétecteurs infrarouges.

== Conclusion
Ce travail pratique combine des simulations DFT via Quantum ESPRESSO et une
analyse approfondie pour explorer les propriétés électroniques de l’arséniure
d’aluminium. En caractérisant sa structure de bande indirecte, sa densité d’états et
ses interactions électroniques, nous visons à comprendre comment ces propriétés
influencent ses applications dans l’optoélectronique et l’électronique haute
performance. Les résultats obtenus, illustrés par des graphiques clés (structure de
bande, DOS), serviront de base pour évaluer le potentiel de l’AlAs dans des
dispositifs innovants, tout en validant l’efficacité de Quantum ESPRESSO comme outil
de prédiction en science des matériaux.

Cette étude s’inscrit dans une démarche plus large d’optimisation des
semiconducteurs III-V, où la modélisation numérique joue un rôle central pour
réduire les coûts expérimentaux et accélérer la découverte de matériaux performants.
////////////////// souhail
= Étude Théorique
La technologie moderne repose sur un composant fondamental qui alimente des appareils allant de l’électronique grand public aux équipements médicaux avancés. Les semi-conducteurs sont essentiels dans des secteurs tels que l’énergie propre, les transports et la défense, favorisant l’innovation et les avancées technologiques.

Ils jouent également un rôle clé dans l’avenir de la technologie, en stimulant les progrès dans des domaines comme l’intelligence artificielle, l’informatique quantique et d’autres innovations révolutionnaires. Ces avancées soulignent l'importance cruciale des semi-conducteurs pour relever les défis mondiaux et transformer notre façon de vivre et de travailler.

== Les Semi-Conducteurs
=== Définition d'un semi-conducteurs
Les semi-conducteurs sont des matériaux dont la conductivité se situe entre celle des conducteurs (généralement des métaux) et celle des non-conducteurs ou des isolants (tels que les céramiques). Les semi-conducteurs peuvent être des composés, comme l'arséniure de gallium ou l'arséniure d'aluminium, ou des éléments purs, comme le germanium ou le silicium. La physique explique les théories, les propriétés et l'approche mathématique liées aux semi-conducteurs.

L'arséniure de gallium, le germanium et le silicium sont quelques-uns des semi-conducteurs les plus couramment utilisés. Le silicium est utilisé dans la fabrication de circuits électroniques, et l'arséniure de gallium est utilisé dans les cellules solaires, les diodes laser, etc.

=== Trous et électrons dans les semi-conducteurs

Les trous et les électrons sont les types de porteurs de charge responsables de la circulation du courant dans les semi-conducteurs. Les trous (électrons de valence) sont les porteurs de charges électriques chargées positivement, tandis que les électrons sont les particules chargées négativement. Les électrons et les trous sont égaux en magnitude mais opposés en polarité.

=== Mobilité des électrons et des trous

Dans un semi-conducteur, la mobilité des électrons est plus élevée que celle des trous. Cela s'explique principalement par leurs structures de bandes et leurs mécanismes de diffusion différents.

Les électrons se déplacent dans la bande de conduction, tandis que les trous se déplacent dans la bande de valence. Lorsqu'un champ électrique est appliqué, les trous ne peuvent pas se déplacer aussi librement que les électrons en raison de leur mouvement restreint. L'élévation des électrons de leur enveloppe interne vers des enveloppes supérieures entraîne la création de trous dans les semi-conducteurs. Étant donné que les trous subissent une force atomique plus forte que les électrons de la part du noyau, leur mobilité est plus faible.

La mobilité d'une particule dans un semi-conducteur est plus grande si

la masse effective des particules est plus faible
le temps entre les événements de diffusion est plus long.
Pour le silicium intrinsèque à $300 K$, la mobilité des électrons est de $1500 frac("cm"^(2) , V.s)$, et la mobilité des trous est de 475 $frac("cm"^(2) , V.s)$.

Le modèle de liaison des électrons dans le silicium de valence 4 est illustré ci-dessous. Ici, lorsqu'un des électrons libres (points bleus) quitte la position du réseau, il crée un trou (points gris). Ce trou ainsi créé prend la charge opposée de l'électron et peut être considéré comme un porteur de charge positive se déplaçant dans le réseau.

#figure(
  image("Semiconductors-1.png"),
  caption: "Concept d'électrons et de trous dans les semi-conducteurs"
)

=== Théorie des bandes des semi-conducteurs
L'introduction de la théorie des bandes a eu lieu pendant la révolution quantique de la science. Walter Heitler et Fritz London ont découvert les bandes d'énergie.
Nous savons que les électrons d'un atome sont présents à différents niveaux d'énergie. Lorsque nous essayons d'assembler le réseau d'un solide avec N atomes, chaque niveau d'un atome doit se diviser en N niveaux dans le solide. Ce fractionnement de niveaux d'énergie nets et très serrés forme des bandes d'énergie. L'écart entre des bandes adjacentes représentant une gamme d'énergies qui ne possèdent pas d'électron est appelé bande interdite.

#figure(
  image("Solid_state_electronic_band_structure.svg"),
  caption: "Exemple hypothétique de formation de bandes"
)

Exemple hypothétique de formation de bandes lorsqu'un grand nombre d'atomes de carbone sont réunis pour former un cristal de diamant. Le graphique de droite montre les niveaux d'énergie en fonction de l'espacement entre les atomes. Lorsque les atomes sont très éloignés les uns des autres (côté droit du graphique), les états propres sont les orbitales atomiques du carbone. Lorsque les atomes sont suffisamment proches (côté gauche) pour que les orbitales commencent à se chevaucher, elles s'hybrident en orbitales moléculaires d'énergies différentes. Comme il y a beaucoup d'atomes, les orbitales sont très proches en énergie et forment des bandes continues. Le principe d'exclusion de Pauli limite à deux le nombre d'électrons dans une seule orbitale, et les bandes sont remplies en commençant par l'énergie la plus basse. À la taille actuelle de la cellule du cristal de diamant, indiquée par a, deux bandes sont formées, séparées par une bande interdite de 5,5 eV.

#figure(
  image("Semiconductors-2.png"),
  caption: "Concept d'électrons et de trous dans les semi-conducteurs"
)

=== Bande de conduction et bande de Valence dans les semi-conducteurs
==== Bande de Valence
La bande d'énergie impliquant les niveaux d'énergie des électrons de valence est appelée bande de valence. Il s'agit de la bande d'énergie occupée la plus élevée. Par rapport aux isolants, la bande interdite des semi-conducteurs est plus petite. Elle permet aux électrons de la bande de valence de passer dans la bande de conduction lorsqu'ils reçoivent une énergie externe.

==== Bande de conduction
Il s'agit de la bande la plus basse, inoccupée, qui comprend les niveaux d'énergie des porteurs de charge positifs (trous) ou négatifs (électrons libres). Elle contient des électrons conducteurs, ce qui entraîne la circulation du courant. La bande de conduction possède un niveau d'énergie élevé et est généralement vide. Dans les semi-conducteurs, la bande de conduction accepte les électrons de la bande de valence.

=== Niveau de Fermi dans les semi-conducteurs
Le niveau de Fermi (noté EF) se situe entre les bandes de valence et de conduction. Il s'agit de l'orbitale moléculaire la plus occupée au zéro absolu. Les porteurs de charge dans cet état ont leurs propres états quantiques et n'interagissent généralement pas entre eux. Lorsque la température s'élève au-dessus du zéro absolu, ces porteurs de charge commencent à occuper des états supérieurs au niveau de Fermi.

$ f(E) = 1/(1 + e^((E-E_(F))/(k_(b)T))) $ 


Remplissage des états électroniques dans différents types de matériaux à l'équilibre. Ici, la hauteur représente l'énergie tandis que la largeur est la densité d'états disponibles pour une certaine énergie dans le matériau répertorié. La teinte suit la distribution de Fermi-Dirac (noir : tous les états sont remplis, blanc : aucun état n'est rempli). Dans les métaux et les semi-métaux, le niveau de Fermi EF se situe à l'intérieur d'au moins une bande.
Dans les isolants et les semi-conducteurs, le niveau de Fermi se trouve à l'intérieur d'une bande interdite ; toutefois, dans les semi-conducteurs, les bandes sont suffisamment proches du niveau de Fermi pour être thermiquement peuplées d'électrons ou de trous. La mention « intrin. » indique qu'il s'agit de semi-conducteurs intrinsèques.

#figure(
  image("Band_filling_diagram.svg"),
  caption: "Le niveau de Fermi d'un corps solide"
)

Dans un semi-conducteur de type p, la densité des états non remplis augmente. Cela permet d'accueillir plus d'électrons dans les niveaux d'énergie inférieurs. En revanche, dans un semi-conducteur de type n, la densité des états augmente, ce qui permet d'accueillir plus d'électrons aux niveaux d'énergie supérieurs.

=== Propriétés des semi-conducteurs
Les semi-conducteurs peuvent conduire l'électricité dans des conditions ou circonstances favorables. Cette propriété unique en fait un excellent matériau pour conduire l'électricité de manière contrôlée, selon les besoins.

Contrairement aux conducteurs, les porteurs de charge dans les semi-conducteurs n'apparaissent que sous l'effet d'une énergie externe (agitation thermique). Celle-ci amène un certain nombre d'électrons de valence à franchir le fossé énergétique et à sauter dans la bande de conduction, laissant un nombre égal d'états énergétiques inoccupés, c'est-à-dire des trous. La conduction due aux électrons et aux trous est tout aussi importante.

  - Résistivité : 10-5 à 106 Ωm
  - Conductivité : 105 à 10-6 mho/m
  - Coefficient de température de la résistance : Négatif
  - Flux de courant : dû aux électrons et aux trous

=== Pourquoi la résistivité des semi-conducteurs diminue-t-elle avec la température ?
La différence de résistivité entre les conducteurs et les semi-conducteurs est due à leur différence de densité de porteurs de charge.

La résistivité des semi-conducteurs diminue avec la température parce que le nombre de porteurs de charge augmente rapidement avec la température, ce qui rend la variation fractionnelle, c'est-à-dire le coefficient de température, négative.

=== Types de semi-conducteurs
Les semi-conducteurs peuvent être classés comme suit :

- Semi-conducteur intrinsèque
- Semi-conducteur extrinsèque

#figure(
  image("Semiconductors-3.png"),
  caption: "Classification des semi-conducteurs"
)

==== Semi-conducteur intrinsèque
Un semi-conducteur intrinsèque est un matériau chimiquement très pur. Il n'est constitué que d'un seul type d'élément.

#figure(
  image("Semiconductors-4.png"),
  caption: "Mécanisme de conduction dans le cas des semi-conducteurs intrinsèques (a) En l'absence de champ électrique (b) En présence d'un champ électrique"
)
Le germanium (Ge) et le silicium (Si) sont les types les plus courants d'éléments semi-conducteurs intrinsèques. Ils possèdent quatre électrons de valence (tétravalents). Ils sont liés à l'atome par une liaison covalente à la température du zéro absolu.

Lorsque la température augmente sous l'effet des collisions, quelques électrons sont libérés et se déplacent librement à travers le réseau, créant ainsi une absence dans sa position d'origine (trou). Ces électrons libres et ces trous contribuent à la conduction de l'électricité dans le semi-conducteur. Les porteurs de charge négatifs et positifs sont en nombre égal.

L'énergie thermique est capable d'ioniser quelques atomes du réseau, ce qui réduit leur conductivité.

=== Diagramme de bande d'énergie d'un semi-conducteur intrinsèque
Le diagramme de bande d'énergie d'un semi-conducteur intrinsèque est illustré ci-dessous.

#figure(
  image("Semiconductors-6.png"),
  caption: "(a) Semi-conducteur intrinsèque à T = 0 Kelvin, se comporte comme un isolant (b) A t>0, quatre paires d'électrons générées thermiquement"
)

Dans les semi-conducteurs intrinsèques, le courant circule en raison du mouvement des électrons libres et des trous. Le courant total est la somme du courant électronique Ie dû aux électrons générés thermiquement et du courant de trou Ih.

$ I_(T) = I_(e) + I_(h) $

Pour un semi-conducteur intrinsèque, à température finie, la probabilité que des électrons existent dans une bande de conduction diminue exponentiellement avec l'augmentation de la bande interdite (Eg).

$ N(E_(g)) = N_(0)e^(-"Eg"/(2."Kb".T)) $

Où,

- Eg = Bande interdite
- Kb = Constantes de Boltzmann

=== Semi-conducteur extrinsèque
La conductivité des semi-conducteurs peut être considérablement améliorée par l'introduction d'un petit nombre d'atomes de remplacement appropriés, appelés IMPURITÉS. Le processus d'ajout d'atomes d'impureté au semi-conducteur pur est appelé DOPAGE. En général, seul un atome sur 107 est remplacé par un atome dopant dans le semi-conducteur dopé. Un semi-conducteur extrinsèque peut être classé en plusieurs catégories :

- semi-conducteur de type N
- Semi-conducteur de type P

#figure(
  image("Semiconductors-9.png"),
  caption: "Classification des semi-conducteurs extrinsèques"
)

==== Semi-conducteur de type N
 - Principalement dû aux électrons
 - Entièrement neutre
 - I = Ih et nh >> ne
 - Majorité - électrons et minorité - trous
Lorsqu'un semi-conducteur pur (silicium ou germanium) est dopé par une impureté pentavalente (P, As, Sb, Bi), quatre des cinq électrons de valence se lient aux quatre électrons du Ge ou du Si.

Le cinquième électron du dopant est libéré. Ainsi, l'atome d'impureté donne un électron libre pour la conduction dans le réseau et est appelé « Donar ».

Comme le nombre d'électrons libres augmente avec l'ajout d'une impureté, les porteurs de charges négatives augmentent. C'est pourquoi on parle de semi-conducteur de type n.

Le cristal dans son ensemble est neutre, mais l'atome donneur devient un ion positif immobile. La conduction étant due à un grand nombre d'électrons libres, les électrons du semi-conducteur de type n sont les PORTEURS MAJORITAIRES et les trous sont les PORTEURS MINORITAIRES.

==== Semi-conducteur de type P
 - Principalement dû aux trous
 - Entièrement neutre
 - I = Ih et nh >> ne
 - Majorité - trous et minorité - électrons
Lorsqu'un semi-conducteur pur est dopé avec une impureté trivalente (B, Al, In, Ga), les trois électrons de valence de l'impureté se lient à trois des quatre électrons de valence du semi-conducteur.

Il en résulte une absence d'électron (trou) dans l'impureté. Ces atomes d'impureté qui sont prêts à accepter les électrons liés sont appelés « accepteurs ».

Lorsque le nombre d'impuretés augmente, le nombre de trous (porteurs de charges positives) augmente. C'est pourquoi on parle de semi-conducteur de type p.

Le cristal, dans son ensemble, est neutre, mais les accepteurs deviennent un ion négatif immobile. La conduction étant due à un grand nombre de trous, les trous du semi-conducteur de type p sont les PORTEURS MAJORITAIRES, et les électrons les PORTEURS MINORITAIRES.

=== Différence entre les semi-conducteurs intrinsèques et extrinsèques

#figure(
  table(
    columns: 2,
    [Semi-conducteur intrinsèque], [Semi-conducteur extrinsèque],

    [Semi-conducteur pur], [Semi-conducteur impur],
    [La densité d'électrons est égale à la densité de trous], [La densité d'électrons n'est pas égale à la densité de trous],
    [La conductivité électrique est faible ], [La conductivité électrique est élevée],
    [Dépendance de la température uniquement], [Dépendance de la température et de la quantité d'impuretés],
    [Pas d'impuretés], [Impureté trivalente et impureté pentavalente],
  ),
  caption: "Différence entre les semi-conducteurs intrinsèques et extrinsèques"
)

=== Utilisations industrielles des semi-conducteurs
Les propriétés physiques et chimiques des semi-conducteurs leur permettent de concevoir des merveilles technologiques telles que les micropuces, les transistors, les diodes électroluminescentes, les cellules solaires, etc.

Le microprocesseur utilisé pour contrôler le fonctionnement des véhicules spatiaux, des trains, des robots, etc., est constitué de transistors et d'autres dispositifs de contrôle, qui sont fabriqués à partir de matériaux semi-conducteurs.

#pagebreak()

== Les méthodes ab initio  et DFT

Les méthodes ab initio sont basées sur la résolution complète des équations de Hartree-Fock, c'est-à-dire le calcul de tous les termes énergétiques et donc de toutes les intégrales. La méthode HF considère l'interaction électronique comme un champ moyen. C'est à dire que chaque électron ressent l'effet des autres électrons de façon moyenne (comme si les autres électrons formaient un nuage homogène d'électrons).

#figure(
  image("Pseudopotential.png"),
  caption: "Pseudopotentiel représentant la charge effective du noyau."
)

Cependant, les approches ab initio traditionnelles utilisant la fonction d'onde multi-électronique comme base doivent recourir à un calcul SCF  pour intégrer les effets de corrélation, alors que les approches DFT intègrent la corrélation au niveau SCF. Les méthodes SCF, telles que la théorie des perturbations ou la théorie des clusters couplés, sont extrêmement coûteuses par rapport à la procédure SCF. D'autre part, bien que l'approche DFT soit exacte en principe, elle repose en pratique sur la modélisation d'une fonctionnelle d'énergie d'échange-corrélation inconnue. Bien que des formes plus précises de ces fonctionnelles soient constamment développées, il n'existe pas de moyen systématique d'améliorer la fonctionnelle pour atteindre un niveau arbitraire de précision. Ainsi, les approches traditionnelles offrent la possibilité d'atteindre un niveau de précision systématiquement améliorable, mais peuvent être exigeantes en termes de calcul, tandis que les approches DFT offrent une voie pratique, mais la théorie est actuellement incomplète.



Le fondement de la chimie quantique non relativiste repose sur la résolution de l'équation de Schrödinger indépendante du temps pour comprendre la structure électronique des molécules. Ce chapitre explore le cadre théorique sous-jacent à ces calculs, en se concentrant sur la séparation des mouvements nucléaires et électroniques, la méthode du champ auto-cohérent (SCF) et l'approximation de combinaison linéaire d'orbitales atomiques (LCAO).


=== 4.2 Équation de Schrödinger Indépendante du Temps

L'équation fondamentale régissant le comportement des électrons dans une molécule est l'équation de Schrödinger indépendante du temps :

$ hat(H)(R,r) Ψ(R,r) = E(R) Ψ(R,r) $

Ici, $hat(H)(R,r)$ représente l'opérateur hamiltonien, $Ψ(R,r)$ est la fonction d'onde décrivant à la fois les coordonnées nucléaires ($R$) et électroniques ($r$), et $E(R)$ est l'énergie totale du système.
"

===  Opérateur Hamiltonien

Dans les unités atomiques, l'opérateur hamiltonien pour un système de $N$ électrons et $M$ noyaux est donné par :

$
hat(H) = -1/2 sum_(i=1)^N nabla_i^2 - 1/2 sum_(A=1)^M frac(1,M_A) nabla_A^2 - sum_(i=1)^N sum_(A=1)^M frac(Z_A,r_("iA")) + sum_(i=1)^N sum_(j > i)^N frac(1,r_("ij")) + sum_(A=1)^M sum_(B > A)^M frac(Z_A Z_B,R_("AB")) 
$

où :
- $nabla_i^2$ est le laplacien par rapport aux coordonnées du $i$-ième électron.
- $nabla_A^2$ est le laplacien par rapport aux coordonnées du $A$-ième noyau.
- $Z_A$ est la charge nucléaire du noyau $A$.
- $M_A$ est le rapport de la masse du noyau $A$ à la masse d'un électron.
- $r_("iA")$ est la distance entre le $i$-ième électron et le $A$-ième noyau.
- $r_("ij")$ est la distance entre les $i$-ième et $j$-ième électrons.
- $R_("AB")$ est la distance entre les noyaux $A$ et $B$.


=== Séparation des Mouvements Nucléaires et Électroniques

Pour simplifier le problème, nous séparons le mouvement des électrons de celui des noyaux en utilisant l'approximation de Born-Oppenheimer. L'opérateur hamiltonien électronique devient :

$
hat(H)_text("elec") = -1/2 sum_(i=1)^N nabla_i^2 - sum_(i=1)^N sum_(A=1)^M frac(Z_A,r_("iA")) + sum_(i=1)^N sum_(j > i)^N frac(1,r_("ij"))
$

L'équation de Schrödinger électronique correspondante est :

$
hat(H)_text("elec") psi_text("elec") = E_text("elec") psi_text("elec")
$

La résolution de cette équation donne l'énergie électronique totale $E_text("elec")$ et la fonction d'onde électronique $Ψ_text("elec")$. L'énergie totale du système est ensuite obtenue en ajoutant l'énergie de répulsion nucléaire-nucléaire :

$
E_text("tot") = E_text("elec") + E_text("nuc")
$

=== Méthode du Champ Auto-Cohérent (SCF)

La méthode SCF est une procédure itérative utilisée pour trouver le meilleur ensemble possible d'orbitales moléculaires (MO) qui décrivent la structure électronique d'une molécule. La mise en œuvre la plus courante de la méthode SCF est l'approximation de Hartree-Fock (HF), bien qu'elle puisse être étendue pour inclure les effets de corrélation électronique via des méthodes comme l'interaction de configuration (CI), le cluster couplé (CC) ou la théorie de la fonctionnelle de densité (DFT).

==== Étapes de la procédure SCF :
1. *Estimation initiale* : Commencez avec une estimation initiale des MO.
2. *Construction de la matrice de Fock* : En utilisant les MO actuels, construisez la matrice de Fock $"F"$, qui inclut à la fois les termes d'énergie cinétique et potentielle dus aux noyaux et aux autres électrons.
3. *Résolution des équations de Roothaan-Hall* : Résolvez les équations de Roothaan-Hall en utilisant la matrice de Fock pour obtenir de nouveaux coefficients d'orbitales moléculaires.
4. *Mise à jour des MO* : Utilisez les nouveaux coefficients d'orbitales moléculaires pour former des orbitales moléculaires mises à jour.
5. *Vérification de la convergence* : Vérifiez si l'énergie et les MO ont convergé à une tolérance spécifiée. Si ce n'est pas le cas, répétez les étapes 2-4 jusqu'à convergence.

#import fletcher.shapes: diamond
#figure(
  diagram(
	  node-stroke: 1pt,
	  node((0,0), [Construire $V_"ion" (r)$], corner-radius: 2pt),
	  edge("-|>"),
    node((0,0.7), [Estimation initiale $n(r)$], corner-radius: 2pt),
    edge("-|>"),
    node((0,1.48), [Calculer $V_H [n] + V_"XC" [n]$], corner-radius: 2pt),
    edge("-|>"),
    node((0,2.1), [$V_"eff" = V_"ion" + V_H [n] + V_"XC" [n]$], corner-radius: 2pt),
    edge("-|>"),
    node((0,2.8), [Résoudre $[ -1/2 nabla^2 + V_"eff" (r)] psi_i (r) = epsilon_i psi_i [n]$], corner-radius: 2pt),
    edge("-|>"),
    node((0,3.6), [Calculer $n(r) = sum |psi_i (r)|^2$], corner-radius: 2pt),
    edge("-|>"),
	  node((0,4.5), align(center)[
		  Cohérent ?
	  ],shape: diamond),
	  edge("l,u,uu,r", "-|>", [NON], label-pos: 0.03),
    edge("r", "-|>", [Oui], label-pos: 0.1),
    node((0.71,4.5), [Forces énergétiques], corner-radius: 2pt),
  ),
  caption: "Étapes de la procédure SCF"
)

En généralisant à un formalisme non restreint en introduisant des orbitales spatiales distinctes pour les spins $α$ et $β$ dans l'équation (14), on obtient les équations de Pople-Nesbet :

$
F_alpha C_alpha = epsilon_alpha S C_alpha
$

$
F_beta C_beta = epsilon_beta S C_beta
$

où $S_(mu nu) = integral phi.alt_mu(r) phi.alt_nu(r)(r) $ est la matrice de recouvrement.

=== Approximation de Combinaison Linéaire d'Orbitales Atomiques (LCAO)

L'approximation LCAO suppose que les orbitales moléculaires peuvent être exprimées comme une combinaison linéaire d'orbitales atomiques (AO) :

$
psi_i(r) = sum_mu c_(mu i) chi_mu(r)
$

où $χ_mu(r)$ sont les orbitales atomiques et $c_("iμ")$ sont les coefficients d'expansion. Le but de la méthode SCF est de déterminer ces coefficients afin que l'énergie totale du système soit minimisée.

=== Équations de Hartree-Fock

Dans le contexte de la théorie de Hartree-Fock, les équations de Roothaan-Hall prennent la forme suivante :

$
"FC" = epsilon"SC"
$

où :
- $F$ est la matrice de Fock.
- $C$ est la matrice des coefficients d'orbitales moléculaires.
- $S$ est la matrice de recouvrement.
- $epsilon$ est une matrice diagonale contenant les énergies orbitales.

=== Théorie de la Fonctionnelle de Densité (DFT)

La théorie de la fonctionnelle de densité (DFT) est apparue comme une approche précise et alternative aux investigations quantiques moléculaires basées sur les principes premiers. Les calculs DFT représentent la majorité écrasante de tous les calculs de chimie quantique, non seulement en raison de leur précision chimique prouvée, mais aussi grâce à leur coût computationnel relativement faible, comparable à celui de la théorie de Hartree-Fock (HF), tout en traitant la corrélation électronique négligée dans un calcul HF. Ces deux caractéristiques suggèrent que la DFT restera probablement une méthode de premier plan dans le kit d'outils du chimiste quantique pour de nombreuses années encore.
==== Théorie Fondamentale de la DFT

La DFT est principalement une théorie des structures de l'état fondamental électronique basée sur la densité électronique $ρ(r)$, contrairement à la fonction d'onde à plusieurs électrons $Psi(r_1,…,r_N)$. (Son extension aux états excités, la DFT dépendante du temps, est discutée dans la Section 7.3.) Il existe plusieurs similarités et différences distinctes entre les approches traditionnelles de la fonction d'onde et les méthodologies modernes de la DFT.

Premièrement, les éléments de base essentiels de la fonction d'onde à plusieurs électrons $Psi$ sont les orbitales monoélectroniques, qui sont directement analogues aux orbitales de Kohn-Sham dans le cadre de la DFT. Deuxièmement, tant la densité électronique que la fonction d'onde à plusieurs électrons tendent à être construites via une approche SCF qui nécessite la construction d'éléments de matrice très similaires.

Cependant, les approches ab initio traditionnelles utilisant la fonction d'onde à plusieurs électrons comme fondation doivent recourir à un calcul post-SCF  pour incorporer les effets de corrélation, tandis que les approches DFT incorporent la corrélation au niveau SCF. Les méthodes post-SCF, telles que la théorie de perturbation ou la théorie du cluster couplé, sont extrêmement coûteuses par rapport à la procédure SCF. D'un autre côté, bien que l'approche DFT soit exacte en principe, en pratique elle repose sur la modélisation d'une fonctionnelle d'énergie d'échange-corrélation inconnue. Bien que des formes plus précises de ces fonctionnelles soient constamment développées, il n'existe pas de moyen systématique pour améliorer la fonctionnelle afin d'atteindre un niveau de précision arbitraire. Ainsi, les approches traditionnelles offrent la possibilité d'atteindre un niveau de précision systématiquement améliorable, mais peuvent être computationnellement exigeantes, tandis que les approches DFT offrent une voie pratique, mais la théorie est actuellement incomplète.

=== Théorie de la Fonctionnelle de Densité de Kohn-Sham

La théorie de la fonctionnelle de densité (DFT) par Hohenberg, Kohn et Sham trouve son origine dans les travaux antérieurs de Dirac, qui a montré que l'énergie d'échange d'un gaz électronique uniforme pouvait être calculée exactement à partir de la densité de charge uniquement. Cependant, bien que cette approche traditionnelle de la fonctionnelle de densité, aujourd'hui appelée "DFT sans orbites", fasse une connexion directe avec la densité seule, en pratique, il s'agit d'une approche directe où les équations nécessaires ne contiennent que la densité électronique, ce qui rend difficile l'obtention de bonnes approximations pour la fonctionnelle d'énergie cinétique. Kohn et Sham ont contourné cette difficulté via une approche indirecte dans laquelle l'énergie cinétique est calculée exactement pour un système de référence non interactif, à savoir le déterminant de Kohn-Sham. C'est cette approche de Kohn-Sham qui a permis à la DFT de devenir un outil pratique pour les calculs.

==== Formalisme de Kohn-Sham

Dans le formalisme de Kohn-Sham, l'énergie électronique de l'état fondamental $E$ peut être écrite comme suit :
$
E = E_T + E_V + E_J + E_("XC")
$

où :
- $E_T$ est l'énergie cinétique,
- $E_V$ est l'énergie d'interaction électron-noyau,
- $E_J$ est l'auto-interaction coulombienne de la densité électronique $ρ(r)$,
- $E_"XC"$ est l'énergie d'échange-corrélation.

En adoptant un format non restreint, les densités totales des électrons $α$ et $β$ peuvent être écrites comme suit :
$
ρ_α(r) = sum_(i=1)^n_α |ψ_"αi"|^2
$
$
ρ_β(r) = sum_(i=1)^n_β |ψ_"βi"|^2
$

où $n_α$ et $n_β$ sont respectivement le nombre d'électrons $α$ et $β$, et $ψ_i$ sont les orbitales de Kohn-Sham. Ainsi, la densité électronique totale est donnée par :
$
ρ(r) = ρ_α(r) + ρ_β(r)
$

Dans un ensemble de base fini, la densité est représentée par :
$
ρ(r) = sum_("μν") P_("μν") ϕ_μ(r) ϕ_ν(r),
$

où les $P_("μν")$ sont les éléments de la matrice de densité monoélectronique.
$ P_(mu nu)=2 sum_(a=1)^(N/2)C_( mu a)C_( nu a) $
Les différentes composantes d'énergie dans Eq. (13) peuvent maintenant être écrites comme suit :

*Énergie Cinétique :*

$
E_T = sum_(i=1)^n_α ⟨ψ_"αi" mid(|) -1/2 nabla^2 mid(|) ψ_"αi"⟩ + sum_(i=1)^n_β ⟨ψ_"βi" mid(|) -1/2 nabla^2 mid(|) ψ_"βi"⟩
$
$
= sum_("μν") P_("μν") ⟨ϕ_μ(r) mid(|) -1/2 nabla^2 mid(|) ϕ_ν(r)⟩
$

*Énergie d'Interaction Électron-Noyau :*

$
E_V = -sum_(A=1)^M Z_A ∫ (ρ(r))/(|r - R_A|) "dr"
$
$
= -sum_("μν") P_("μν") sum_A ⟨ϕ_μ(r) mid(|) (Z_A)/(|r - R_A|) mid(|) ϕ_ν(r)⟩
$

*Énergie de Coulomb :*

$
E_J = 1/2 ⟨ρ(r_1) mid(|) 1/(|r_1 - r_2|) mid(|) ρ(r_2)⟩
$
$
= 1/2 sum_("μν") sum_("λσ") P_("μν") P_("λσ") ("μν|λσ")
$

*Énergie d'Échange-Corrélation :*

$
E_("XC") = ∫ f[ρ(r), nabla ρ(r), …] ρ(r) "dr".
$

Minimiser $E$ par rapport aux coefficients orbitaux inconnus de Kohn-Sham conduit à un ensemble d'équations matricielles exactement analogues aux équations de Pople-Nesbet du cas UHF, Eq. (9), mais avec des éléments modifiés de la matrice de Fock [cf. Eq. (26)] :
$
F^α_("μν") = H^("core")_("μν") + J_("μν") - F^("XC" α)_("μν")
$
$
F^β_("μν") = H^("core")_("μν") + J_("μν") - F^("XC" β)_("μν")
$

Ici, $F^("XC" α)$ et $F^("XC" β)$ sont les parties d'échange-corrélation des matrices de Fock et dépendent de la fonctionnelle d'échange-corrélation utilisée. La théorie UHF est récupérée comme un cas particulier simplement en prenant $F^("XC" α)_("μν") = K^α_("μν")$, et de manière similaire pour $β$. Ainsi, la densité et l'énergie sont obtenues de manière analogue à celle de la méthode HF. Des estimations initiales sont faites pour les coefficients MO et un processus itératif est appliqué jusqu'à ce que la cohérence soit atteinte.

#include "salma.typ"
#include "fatima.typ"
#include "omar.typ"
