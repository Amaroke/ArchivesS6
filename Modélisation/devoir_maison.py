# MATHIEU STEINBACH Hugo
# 
# # 1.La bande passante de c est la plus petite valeur disponnible entre un rij et un rij+1 sur le chemin.
# 2.Le meilleur chemin parmis plusieurs chemins disponible est celui ayant le plus petit élément dans la matrice étant plus grand que le plus plus petit élément dans la matrice des autres chemins.


def recuperer_bande_passante_max(reseau, route):
    # J'initialise le flot max à +infini.
    bande_passante_max = float("inf")
    # Je les sommets de ma route.
    for i in range(0, len(route) - 1):
        # Je met à jour mon flot max, en prenant la valeur de la plus petite arête parcourue.
        bande_passante_max = min(bande_passante_max, reseau[route[i]][route[i + 1]])
    return bande_passante_max


def recherche_route(
    reseau, routeur_source, routeur_destination, sommets_visites, route, routes
):
    # J'indique que j'ai visité le routeur source.
    sommets_visites[routeur_source] = True
    # Je créé une copie de ma route, pour pouvoir l'éditer.
    route = route.copy()
    # J'ajoute le routeur source à ma route.
    route.append(routeur_source)

    # Si le routeur source est est le routeur de destination.
    if routeur_source is routeur_destination:
        # J'ajoue ma route à ma liste de routes.
        routes.append(route)
    else:
        # je parcours mes sommets.
        for i in range(0, len(reseau)):
            # Si je ne l'ai pas encore visité et qu'il existe un chemin.
            if not (sommets_visites[i]) and not (reseau[routeur_source][i] == 0):
                # Je lance la recherche de chemin depuis le sommet parcourue.
                recherche_route(
                    reseau, i, routeur_destination, sommets_visites, route, routes
                )
    sommets_visites[routeur_source] = False


def affichage_route(meilleure_route):
    # ATTENTION s'il y a plus de sommets que de lettres dans l'alphabet, les sommets prendront le même nom.
    alphabet = [
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z",
    ]
    # J'affiche les chemins en suivant la logique sommet 0 = A, sommet 1 = B, etc...
    print(
        "Le meilleur chemin de",
        alphabet[meilleure_route[0 % 26]],
        "à",
        alphabet[meilleure_route[len(meilleure_route) - 1] % 26],
        "est le suivant : ",
        end="",
    )
    for i in range(0, len(meilleure_route) - 1):
        print(alphabet[meilleure_route[i] % 26], "→ ", end="")
    print(alphabet[meilleure_route[len(meilleure_route) - 1] % 26])


def meilleur_routage(reseau, routeur_source, routeur_destination):

    # Je récupère la taille de mon réseau.
    taille_reseau = len(reseau)
    # J'initialise une liste vide de routes.
    routes = []
    # Je fais une liste qui enregistre tous les sommets visités, initialisé à Faux pour chaque sommet.
    sommets_visites = taille_reseau * [False]

    # Je lance la recherche de tous les chemins depuis le routeur source jusqu'au routeur de destination.
    recherche_route(
        reseau, routeur_source, routeur_destination, sommets_visites, [], routes
    )

    # J'initialise une variable à moins l'infini, cette variable prendra la valeur du flot maximal parmis tous les chemins disponibles.
    bande_passante_max = -float("inf")
    # J'enregistre la meilleure route, représentée par la liste des sommets, initialement vide.
    meilleure_route = []

    # Je parcours mes routes.
    for route in routes:
        # Je récupère le flot de la route parcourue que je définis comme la meilleure.
        bande_passante_max_temporaire = recuperer_bande_passante_max(reseau, route)
        # Si la route est meilleure que celle trouvée précédement.
        if bande_passante_max_temporaire > bande_passante_max:
            # Je met à jour le flot max trouvé.
            bande_passante_max = bande_passante_max_temporaire
            # Et je met à jour la meilleure route.
            meilleure_route = route

    affichage_route(meilleure_route)


# La matrice des bandes passantes correspondante au graphe donné en exemple, c'est elle qu'il faut remplacer pour faire d'autres tests.
# ATTENTION s'il y a plus de sommets que de lettres dans l'alphabet, les sommets prendront le même nom.
reseau = [
    [0, 5, 8, 0, 0, 0],  # A
    [0, 0, 2, 4, 2, 4],  # B
    [0, 0, 0, 3, 1, 0],  # C
    [0, 0, 0, 0, 1, 6],  # D
    [0, 0, 0, 0, 0, 5],  # E
    [0, 0, 0, 0, 0, 0],  # F
]

# Pour ici, on peut modifier les tests, en donnant autre chose que 0 et 5, actuellement 0 et 5 signifie un chemin du sommet 0 (A) au sommet 5 (F).
meilleur_routage(reseau, 0, 5)  # De A à F.
meilleur_routage(reseau, 0, 2)  # De A à C.
meilleur_routage(reseau, 3, 5)  # De D à F.
meilleur_routage(reseau, 0, 0)  # De D à F.

# MATHIEU STEINBACH Hugo