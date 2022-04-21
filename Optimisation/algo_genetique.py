import pygad
import sys

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


class Probleme:
    def __init__(this, clients, ingredients, solution):
        # Contient la liste de tous les clients.
        this.clients = clients
        # Contient la liste de tous les ingrédients.
        this.ingredients = ingredients
        this.solution = solution  # La solution au problème.

    # Utilisation de PyGAD (inspiré de Jacques Supcik : https://dev.to/supcik/solving-the-hash-code-2022-practice-challenge-with-70-lines-of-code-1a6k)
    def resoudre(this):
        liste_ingredients = sorted(list(this.ingredients))

        def fitness_func(solution, unused):
            pizza = set([liste_ingredients[k]
                        for (k, v) in enumerate(solution) if v == 1])
            score = 0
            for client in this.clients:
                if (client.aime & pizza == client.aime and client.deteste & pizza == set()):
                    score += 1
            return score

        ga_instance = pygad.GA(
            num_generations=100,
            num_parents_mating=2,
            sol_per_pop=3,
            num_genes=len(liste_ingredients),
            fitness_func=fitness_func,
            init_range_low=0,
            init_range_high=2,
            random_mutation_min_val=0,
            random_mutation_max_val=2,
            mutation_by_replacement=True,
            mutation_probability=0.5,
            gene_type=int)

        ga_instance.run()
        solution = ga_instance.best_solution()[0]
        this.solution = set([liste_ingredients[k]
                            for (k, v) in enumerate(solution) if v == 1])

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
            this.resoudre()  # On résoud le problème.
        # On écrit les résultats.
        with open(f"out_algo_genetique/{instance_file[17].upper()}_genetique.txt", "w") as f:
            f.write(f"{len(this.solution)} ")
            f.write(" ".join(this.solution))


Probleme([], set(), set()).lire_ecrire_fichiers()