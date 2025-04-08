# IA et programmation de Jeux-vidéo

## Modalités d’évaluation

### 1. Projet

Dans ce module vous avez appris différentes techniques :

* Flocking(boids)
* Finite State Machines (FSM)
* Pathfinding
* Parcours de graphe, backtracking
* Minimax + alpha/béta pruning

L’évaluation repose pour les deux tiers sur un projet individuel à remettre et présenter le lundi 28 avril (20mn de présentation + questions orales par personne, dépôt du code + doc présentation/slides sur Moodle).

Le projet sera une démo montrant votre maîtrise des techniques ci-dessus vues en cours. Nous conseillons l’utilisation du framework Löve2D et du langage Lua vus en cours pour prototyper rapidement une démo en 2D, mais vous pouvez utiliser tout autre langage ou framework avec lequel vous êtes à l’aise (Python et Pygame, Javascript/Typescript, C#, java, etc.).

Si vous le souhaitez, une base est à votre disposition avec un personnage animé se déplaçant sur une grille avec des murs, etc (voir le dossier Code-exemple/Base-atelier-pathfinding-love2D). Cela n’est pas obligatoire, vous pouvez bien sûr créer votre propre base et il n‘y a aucune exigence en matière de design. Nous nous focalisons sur la mise en œuvre d’algorithmes, même si bien sûr votre créativité et votre sens esthétique seront également appréciés, ne perdez pas de temps sur la finition esthétique de la démo.

Il faut que la démo représente un temps de travail, d’investissement, de recherche significatif, et comparable entre les différents projets. Par exemple :

* Un démo mettant en œuvre flocking, FSM et pathfinding. Un cas typique serait une petite démo de type jeu de rôle/aventure action avec un personnage qui interagit avec un environnement (effets de flocking), des PNJ (FSM), et du pathfinding (contrôle du joueur, ou ennemis). Ce peut-être aussi un shooter, avec des tirs (pathfinding des armes à « têtes chercheuses »), flocking (nué d’ennemis), et des comportement élaboré d’un PNJ (boss, avec une stratégie). Etc. La créativité et l’originalité de la mise en œuvre de ces techniques fait partie de la note. Nous n’attendons pas un jeu forcément jouable (mais ce sera apprécié), mais un minimum d’interactivité est exigé.
* Une démo d’implémentation d’un minimax pour un jeu d’opposition (dames, échecs, reversi/othello, etc.). La qualité des heuristiques ou de la fonction de coût sera appréciée, ainsi que la performance de l’algorithme. Par contre pour des jeux plus simples (puissance 4 par exemple), une simple implémentation de minimax ne suffira pas. Il sera alors exigé d’enrichir la démo - y compris sur le plan purement esthétique - avec 2 ou 3 autres techniques vue en cours (flocking, pour des effets, FSM pour un concept original associant des PNJ, etc.). Les projets doivent être équivalents quant au volume de travail mobilisé : on compensera la facilité d’une implémentation en augmentant le nombre de techniques à implémenter. Une autre option est le défi Pacman proposé par Nicolas Rochet (programmer un Pacman automatisé - sans joueur humain), cf. le lien sur le site du cours.

Il est fortement recommandé de présenter les contours de chaque projet à l’enseignant avant la fin des cours du mardi 8 avril, pour validation.

### 2. QCM 

Un QCM sera proposé lundi 28 avril, sur table, en temps limité, pour évaluer votre assimilation de la théorie. Révisez bien ! La cotation prendra en compte non seulement les réponses correctes, mais aussi les réponses incorrectes (malus) : soyez prudent-e-s. Ce QCM comptera pour un tiers de la note.

### 3. Note de participation

Un bonus de participation sera conféré en fonction de l’attitude en cours, de l’engagement, de la participation, de la qualité du travail sur le projet ou de sa conception durant les séances de travail dédiées en cours.