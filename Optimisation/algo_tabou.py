import sys
import random

try:
    instance_file = sys.argv[1]
except:
    raise Exception("Erreur à la lecture des arguments. Syntaxe de la commande :\n\
        python3 evaluation.py <chemin_vers_fichier_d_entree>")


class Client:
    def __init__(this, aime, deteste):
        # Liste des ingrédients aimés par le client.
        this.aime = aime
        # Liste des ingrédients que le client n'aime pas.
        this.deteste = deteste


class Tabou:
    def __init__(this, clients, ingredients, solution):
        # Contient la liste de tous les clients.
        this.clients = clients
        # Contient la liste de tous les ingrédients.
        this.ingredients = ingredients
        this.solution = solution  # La solution au problème.
        this.tabou = list()

    def get_InitialSolution(this):
        # On tire un nombre d'ingrédient aléatoire pour notre solution initiale.
        nb_ingredients_soluce_init = random.randrange(
            (int)(80/100*(len(this.ingredients)+1)), (int)(len(this.ingredients)+1))
        # On copie la liste d'ingrédients.
        ingredients_list = [x for x in this.ingredients]
        # On initialise une liste avec des ingrédients pris aléatoirement dans la liste des ingrédients.
        initial_solution = list()
        for i in range(0, nb_ingredients_soluce_init):
            # On prends un ingrédient au hasard.
            ingredient_choisi = random.choice(ingredients_list)
            # On l'ajoute à la solution initiale.
            initial_solution.append(ingredient_choisi)
            # On le retire de la liste copiée.
            ingredients_list.remove(ingredient_choisi)
        return initial_solution

    def get_Voisinage(this, solution_initiale):
        # Avec cette fontion on cherche les solutions voisines

        # On copie la liste d'ingrédients.
        liste_ingredients = [x for x in this.ingredients]

        # On copie la solution.
        solution = solution_initiale.copy()

        # On randomise entre 0 et 1.
        on_enleve_ou_pas = random.randrange(0, 2)

        if(on_enleve_ou_pas == 1):
            # On prends un ingrédient au hasard.
            ingredient_choisi = random.choice(liste_ingredients)
            if(ingredient_choisi in solution):
                # On l'enleve à la solution initiale.
                solution.remove(ingredient_choisi)
            else:
                solution.append(ingredient_choisi)  # Ou on l'ajoute.
        else:
            if(len(solution) > 0):
                solution.pop(random.randrange(0, len(solution)))

        return solution

    # Fonction qui calcul le score d'une solution.
    def compute_score(this, solution):
        s = 0
        for client in this.clients:
            aime = set(client.aime)
            deteste = set(client.deteste)
            if(aime.issubset(solution) and len(deteste.intersection(solution)) == 0):
                s += 1
        return s

    # Fonction qui donne la meilleure solution entre deux.
    def meilleur(this, solution, solution_voisine):
        compute_solution = this.compute_score(solution)
        compute_solution_voisine = this.compute_score(solution_voisine)
        if(compute_solution > compute_solution_voisine):
            return solution
        else:
            return solution_voisine

    # Fonction implémentant un algo de recherche tabou.
    def fct_tabou(this):
        s0 = this.get_InitialSolution()
        sBest = s0
        this.tabou = []
        this.tabou.append(s0)
        i = 0
        # On fixe le critère d'arrêt à 30000 opérations
        while (i < 30000/(int)(len(this.ingredients)+1)):
            bestCandidate = this.meilleur(this.get_Voisinage(sBest), sBest)
            if (this.compute_score(bestCandidate) > this.compute_score(sBest)):
                sBest = bestCandidate
            this.tabou.append(bestCandidate)
            i += 1
        return this.tabou[len(this.tabou)-1]

    def lire_ecrire_fichiers(this):
        # Pour le problème donné en paramètre.
        with open(f"{instance_file}") as f:
            n = int(f.readline())
            # Pour chaque ligne du fichier.
            for i in range(n):
                # On récupère les clients.
                client = Client(
                    set(f.readline().strip().split()[1:]),
                    set(f.readline().strip().split()[1:])
                )
                # On ajoute le client à la liste.
                this.clients.append(client)
                # On récupère la liste de tous ingrédients.
                this.ingredients |= client.aime
                this.ingredients |= client.deteste
            this.solution = this.fct_tabou()
        # On écrit les résultats.
        with open(f"out_algo_tabou/{instance_file[17].upper()}_tabou.txt", "w") as f:
            f.write(f"{len(this.solution)} ")
            f.write(" " + str(this.solution).replace('(',
                                                     '').replace(')', '').replace('\'', '').replace(',', '').replace('[', '').replace(']', '') + "\n")


Tabou([], set(), set()).lire_ecrire_fichiers()
