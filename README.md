# S102 - Comparaison d'approches algorithmiques

Petit programme de manipulation d'image.

 ![Screenshot of the program](https://github.com/cursedastronaut/S102-Comparaison-d-approches-algorithmiques/raw/master/ppm_tests/readme.png)

## NBGC
Le contenu demandé par le sujet du projet de l'IUT d'Orsay se trouve dans `src/nbgc.*pp`.
Il s'agit d'une classe `Image` qui supporte l'application de différents filtres et l'export de différents outils.

### Filtres
| Nom du filtre        | Description du filtre                                            |
|----------------------|------------------------------------------------------------------|
| `composanteRouge`    | Ne conserve que le canal de couleur rouge.                       |
| `niveauxGris`        | Ne conserve que la moyenne des couleurs en variantes de gris     |
| `noirEtBlanc`        | N'utilise que du noir absolu ou du blanc absolu                  |
| `changeLuminosity`   | Augmente ou réduit la moyenne d'intensité                        |
| `luminosityUp`       | Augmente la moyenne d'intensité                                  |
| `luminosityDown`     | Réduit la moyenne d'intensité                                    |
| `changeContraste`    | Augmente ou réduit le contraste                                  |
| `contrasteUp`        | Augmente le contraste                                            |
| `contrasteDown`      | Réduit le contraste                                              |
| `rotationD`          | Tourne l'image de 90° sur la droite                              |
| `rotationG`          | Tourne l'image de 90° sur la gauche                              |
| `retournementH`      | Retourne l'image horizontalement                                 |
| `retournementV`      | Retourne l'image verticalement                                   |
| `rognerD`            | Retire une colonne en partant de la droite                       |
| `rognerG`            | Retire une colonne en partant de la gauche                       |
| `rognerH`            | Retire une ligne en partant du haut                              |
| `rognerB`            | Retire une ligne en partant du bas                               |
| `agrandissement`     | Agrandit l'image par un facteur donné                            |
| `retrecissement`     | Rétrécit l'image par un facteur donné                            |
| `visionDeuteranopie` | Simule une vision deutéranope                                    |
| `visionProtanopie`   | Simule une vision protanope                                      |
| `visionTritanopie`   | Simule une vision tritanope                                      |
| `contourSobel`       | Applique la formule "Contour de Sobel"                           |

## Compilation

Pour compiler, vous pouvez simplement utiliser la commande `make`:
```bash
make -j$(nproc)
```

### Dépendances

Bien que la partie principale, NBGC, n'a pas de dépendance en tant que tel (si ce n'est la librairie standard), le reste du programme en a:

| Nom de la dépendance | Version | Source incluses? | Incluse au format pré-compilé? |
|----------------------|---------|------------------|--------------------------------|
| ImGui                | 1.90.0  | Oui              | Non                            |
| GLFW                 | 3.2     | Non              | Windows uniquement             |

## MIT License

Copyright 2023-2026 GALAAD MARTINEAUX

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
