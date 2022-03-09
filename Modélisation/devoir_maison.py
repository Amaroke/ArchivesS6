# MATHIEU STEINBACH Hugo

# Je définis une classe arête qui contient la bande passante d'un routeur source à un routeur destination.
class arete:
    def __init__(arc, source, destination, bande_passante):
        arc.source = source
        arc.destination = destination
        arc.bande_passante = bande_passante


# Je parcours ma matrice et je créé la liste d'arêtes correspondantes que je récupère comme résultat.
def init_graphe(matrice):
    aretes = []
    # Je parcours tous les sommets du graphe, et je créé les arêtes lorsqu'elle existe.
    for i in range(len(matrice)):
        for j in range(len(matrice[i])):
            # Si l'arête existe d'après la matrice, on créé l'arête.
            if matrice[i][j] != 0:
                aretes.append(arete(i, j, matrice[i][j]))
    return aretes


def parcourir(sommet, aretes, bandes_passantes):
    # Je parcours mes arêtes.
    for arete in aretes:
        # Si la source de l'arête parcourue correspond au sommet actuellement regardé.
        if arete.source == sommet:
            # Je prends le min entre la bande passante de l'arête parcourue et celle précédement enregistrée.
            bande_passante_arete = min(
                bandes_passantes[sommet][0], arete.bande_passante
            )
            # Je récupère l'ancienne bande passante pour aller à la destination.
            destination = bandes_passantes[arete.destination]
            # On conserve la plus grande bande_passante.
            if bande_passante_arete > destination[0]:
                destination = (bande_passante_arete, sommet)
            # Je la met à jour
            bandes_passantes[arete.destination] = destination


def route(bandes_passantes, routeur_source, routeur_destination):
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
    print(
        "Le meilleur chemin de",
        alphabet[routeur_source % 26],
        "à",
        alphabet[routeur_destination - 1 % 26],
        "est le suivant : ",
        end="",
    )
    # On met le premier sommet parcouru.
    route = alphabet[routeur_source % 26]
    # On récupère le nombre de sommets.
    nb_sommets = len(bandes_passantes) - 1
    sommets = []
    # On récupère les sommets dans l'ordre du parcours du dernier au premier.
    while bandes_passantes[nb_sommets][1] != -1:
        sommets.append(nb_sommets)
        nb_sommets = bandes_passantes[nb_sommets][1]
    # On remet les sommets dans l'ordre du parcours.
    sommets.reverse()
    # On affiche la route.
    for s in sommets:
        route += " → " + alphabet[(s + routeur_source) % 26]
    return route


def meilleur_routage(reseau, routeur_source, routeur_destination):

    graphe = [] * (routeur_destination - routeur_source)
    for i in range(routeur_source, routeur_destination):
        liste = []
        for j in range(routeur_source, routeur_destination):
            liste.append(reseau[i][j])
        graphe.append(liste)

    # Je récupère toutes les arêtes de mon graphe.
    arcs = init_graphe(graphe)

    # On initialiser les bandes passantes.
    bandes_passantes = [(-float("inf"), -1)] * len(graphe)
    bandes_passantes[0] = (float("inf"), -1)

    for sommet in range(len(bandes_passantes)):
        parcourir(sommet, arcs, bandes_passantes)

    print(route(bandes_passantes, routeur_source, routeur_destination))


# La matrice des bandes passantes correspondante au graphe donné en exemple, c'est elle qu'il faut remplacer pour faire d'autres tests.
# Attention s'il y a plus de sommets que de lettres dans l'alphabet, ils auront le même nom.
reseau = [
    [0, 5, 8, 0, 0, 0],  # A
    [0, 0, 2, 4, 2, 4],  # B
    [0, 0, 0, 3, 1, 0],  # C
    [0, 0, 0, 0, 1, 6],  # D
    [0, 0, 0, 0, 0, 5],  # E
    [0, 0, 0, 0, 0, 0],  # F
]

# Pour ici, on peut modifier les tests, en donnant autre chose que 0 et 6, actuellement 0 et 6 signifie un chemin du sommet 0 (A) au sommet 6 (F).
meilleur_routage(reseau, 0, 6)

# D'autres tests :
meilleur_routage(reseau, 1, 6)  # De A à F
meilleur_routage(reseau, 2, 6)  # De B à F
meilleur_routage(reseau, 3, 6)  # De C à F
meilleur_routage(reseau, 4, 6)  # De D à F
meilleur_routage(reseau, 5, 6)  # De E à F
meilleur_routage(reseau, 1, 4)  # De B à D
