from itertools import chain, combinations
import sys

try:
    instance_file = sys.argv[1]
except:
    raise Exception("Erreur à la lecture des arguments. Syntaxe de la commande :\n\
        python3 evaluation.py <chemin_vers_fichier_d_entree>")


# Fonction qui évalue le score d'une solution (inspiré de la fonction de COIFFIER Guillaume, dans evaluation.py).
def compute_score(solution_set):
    with open(f"{instance_file}") as f:
        s = 0
        n = int(f.readline())
        for i in range(n):
            aime = set((f.readline().strip().split()[1:]))
            deteste = set((f.readline().strip().split()[1:]))
            if(aime.issubset(solution_set) and len(deteste.intersection(solution_set)) == 0):
                s += 1
    return s


# Je récupère d'abord tous les ingrédients.
ingredients = set()
with open(f"{instance_file}") as f:
    n = int(f.readline())
    for i in range(n):
        ingredients |= set(f.readline().strip().split()[1:])
        ingredients |= set(f.readline().strip().split()[1:])

meilleur_x = None
meilleur_score = 0
with open(f"out_enumeration/{instance_file[17].upper()}_enumeration.txt", "w") as f:
    # Pour chaque combinaison d'ingrédients possible j'évalue le score, je met à jour le meilleur.
    for x in chain.from_iterable(combinations(ingredients, r) for r in range(len(ingredients)+1)):
        score_x = compute_score(x)
        # Les résultats diffèrent en fonction de si l'on utilise <= ou <, mais les scores sont égaux.
        if meilleur_score <= score_x:
            meilleur_score = score_x
            meilleur_x = x
    # J'écris la meilleure solution dans mon fichier de résultat.
    f.write(str(len(meilleur_x)) + " " + str(meilleur_x).replace('(',
            '').replace(')', '').replace('\'', '').replace(',', '') + "\n")
