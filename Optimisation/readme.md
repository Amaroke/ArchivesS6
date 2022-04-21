# Bibliothèques nécessaires :

PyGAD : https://pygad.readthedocs.io/en/latest/
Installation avec PyPI : *pip install pygad*

## enumeration.py

### Création des résultats avec enumeration.py 1 par 1 :
- python3 enumeration.py DonneesCodePizza/a_exemple.txt
- python3 enumeration.py DonneesCodePizza/b_basique.txt
- python3 enumeration.py DonneesCodePizza/c_grossier.txt 

### Création de tous les résultats avec enumeration.py en une ligne :
- python3 enumeration.py DonneesCodePizza/a_exemple.txt && python3 enumeration.py DonneesCodePizza/b_basique.txt && python3 enumeration.py DonneesCodePizza/c_grossier.txt 

### Tests des résultats avec enumeration.py 1 par 1 :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_enumeration/A_enumeration.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_enumeration/B_enumeration.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_enumeration/C_enumeration.txt

### Tests de tous les résultats avec enumeration.py en une ligne :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_enumeration/A_enumeration.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_enumeration/B_enumeration.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_enumeration/C_enumeration.txt

### Toutes les générations et les tests de enumeration.py :
- python3 enumeration.py DonneesCodePizza/a_exemple.txt && python3 enumeration.py DonneesCodePizza/b_basique.txt && python3 enumeration.py DonneesCodePizza/c_grossier.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_enumeration/A_enumeration.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_enumeration/B_enumeration.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_enumeration/C_enumeration.txt

## algo_genetique.py

### Création des résultats avec algo_genetique.py 1 par 1 :
- python3 algo_genetique.py DonneesCodePizza/a_exemple.txt
- python3 algo_genetique.py DonneesCodePizza/b_basique.txt
- python3 algo_genetique.py DonneesCodePizza/c_grossier.txt 
- python3 algo_genetique.py DonneesCodePizza/d_difficile.txt 
- python3 algo_genetique.py DonneesCodePizza/e_elabore.txt 

### Création de tous les résultats avec algo_genetique.py en une ligne :
- python3 algo_genetique.py DonneesCodePizza/a_exemple.txt && python3 algo_genetique.py DonneesCodePizza/b_basique.txt && python3 algo_genetique.py DonneesCodePizza/c_grossier.txt && python3 algo_genetique.py DonneesCodePizza/d_difficile.txt && python3 algo_genetique.py DonneesCodePizza/e_elabore.txt 

### Tests des résultats avec algo_genetique.py 1 par 1 :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_genetique/A_genetique.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_genetique/B_genetique.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_genetique/C_genetique.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_genetique/D_genetique.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_genetique/E_genetique.txt

### Tests de tous les résultats avec algo_genetique.py en une ligne :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_genetique/A_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_genetique/B_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_genetique/C_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_genetique/D_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_genetique/E_genetique.txt

### Toutes les générations et les tests de algo_genetique.py :

- python3 algo_genetique.py DonneesCodePizza/a_exemple.txt && python3 algo_genetique.py DonneesCodePizza/b_basique.txt && python3 algo_genetique.py DonneesCodePizza/c_grossier.txt && python3 algo_genetique.py DonneesCodePizza/d_difficile.txt && python3 algo_genetique.py DonneesCodePizza/e_elabore.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_genetique/A_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_genetique/B_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_genetique/C_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_genetique/D_genetique.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_genetique/E_genetique.txt 

## algo_tabou.py

### Création des résultats avec algo_tabou.py 1 par 1 :
- python3 algo_tabou.py DonneesCodePizza/a_exemple.txt
- python3 algo_tabou.py DonneesCodePizza/b_basique.txt
- python3 algo_tabou.py DonneesCodePizza/c_grossier.txt 
- python3 algo_tabou.py DonneesCodePizza/d_difficile.txt 
- python3 algo_tabou.py DonneesCodePizza/e_elabore.txt 

### Création de tous les résultats avec algo_tabou.py en une ligne :
- python3 algo_tabou.py DonneesCodePizza/a_exemple.txt && python3 algo_tabou.py DonneesCodePizza/b_basique.txt && python3 algo_tabou.py DonneesCodePizza/c_grossier.txt && python3 algo_tabou.py DonneesCodePizza/d_difficile.txt && python3 algo_tabou.py DonneesCodePizza/e_elabore.txt 

### Tests des résultats avec algo_tabou.py 1 par 1 :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_tabou/A_tabou.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_tabou/B_tabou.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_tabou/C_tabou.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_tabou/D_tabou.txt
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_tabou/E_tabou.txt

### Tests de tous les résultats avec algo_tabou.py en une ligne :
- python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_tabou/A_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_tabou/B_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_tabou/C_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_tabou/D_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_tabou/E_tabou.txt

### Toutes les générations et les tests de algo_tabou.py :

- python3 algo_tabou.py DonneesCodePizza/a_exemple.txt && python3 algo_tabou.py DonneesCodePizza/b_basique.txt && python3 algo_tabou.py DonneesCodePizza/c_grossier.txt && python3 algo_tabou.py DonneesCodePizza/d_difficile.txt && python3 algo_tabou.py DonneesCodePizza/e_elabore.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/a_exemple.txt out_algo_tabou/A_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/b_basique.txt out_algo_tabou/B_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/c_grossier.txt out_algo_tabou/C_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/d_difficile.txt out_algo_tabou/D_tabou.txt && python3 DonneesCodePizza/evaluation.py DonneesCodePizza/e_elabore.txt out_algo_tabou/E_tabou.txt 