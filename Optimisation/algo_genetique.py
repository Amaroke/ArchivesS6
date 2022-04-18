import pygad


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

    ### UTILISATION DE PYGAD ###
    # A COMPRENDRE + MODIF

    def solve(self):
        ingr_list = sorted(list(self.ingredients))

        def fitness_func(solution, solution_idx):
            pizza = set([ingr_list[k]
                        for (k, v) in enumerate(solution) if v == 1])
            result = 0
            for c in self.clients:
                if (c.aime & pizza == c.aime and c.deteste & pizza == set()):
                    result += 1
            return result

        ga_instance = pygad.GA(
            num_generations=100,
            num_parents_mating=2,
            sol_per_pop=3,
            num_genes=len(ingr_list),
            fitness_func=fitness_func,
            init_range_low=0,
            init_range_high=2,
            random_mutation_min_val=0,
            random_mutation_max_val=2,
            mutation_by_replacement=True,
            gene_type=int)

        ga_instance.run()

        solution, solution_fitness, solution_idx = ga_instance.best_solution()
        self.solution = set([ingr_list[k]
                            for (k, v) in enumerate(solution) if v == 1])

    ##############################

    def lire_ecrire_fichiers(this, fichier):
        # Pour le problème donné en paramètre.
        with open(f"DonneesCodePizza/{fichier}.txt") as f:
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
            this.solve()  # On résoud le problème.
        # On écrit les résultats.
        with open(f"out_algo_genetique/{fichier[0].upper()}_genetique.txt", "w") as f:
            f.write(f"{len(this.solution)} ")
            f.write(" ".join(this.solution))


a = Probleme([], set(), set())
a.lire_ecrire_fichiers("a_exemple")
b = Probleme([], set(), set())
b.lire_ecrire_fichiers("b_basique")
c = Probleme([], set(), set())
c.lire_ecrire_fichiers("c_grossier")
d = Probleme([], set(), set())
d.lire_ecrire_fichiers("d_difficile")
e = Probleme([], set(), set())
e.lire_ecrire_fichiers("e_elabore")