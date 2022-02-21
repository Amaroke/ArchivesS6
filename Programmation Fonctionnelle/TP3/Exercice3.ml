(*
1.
*)
type int_tree = Feuille of int | Noeud of (int_tree*int_tree);;

(*
2.
*)
let rec left abr = match abr with 
| Feuille x -> x
| Noeud(a, b) -> left a;;

(*
3.
*)
let rec nb_nodes abr = match abr with
| Feuille x -> 0
| Noeud(a, b) -> nb_nodes a + nb_nodes b + 1;;

(*
4.
*)
let rec nb_leaves abr = match abr with
| Feuille x -> 1
| Noeud(a, b) -> nb_leaves a + nb_leaves b;;

(*
5.
*)
let rec depth_tree abr = match abr with
| Feuille x -> 1
| Noeud (a,b) -> 1 + if depth_tree a > depth_tree b then depth_tree a else depth_tree b;;

(*
6.
*)
let rec sum_tree abr = match abr with
| Feuille x -> x
| Noeud(a,b) -> sum_tree a + sum_tree b;;

(*
7. Ça parcourt l'arbre et ça match à chaque noeud de l'arbre de manière similaire.
*)

(*
8.
*)
let rec fold_tree (f, g) t = match t with
| Feuille n -> f n
| Noeud(a,b) -> g (fold_tree (f, g) a) (fold_tree (f, g) b);; 

(*
9.
*)

let left_fold = fun t -> fold_tree ((fun x -> x), (fun a -> fun b -> a)) t ;;

let nb_nodes_fold = fun t -> fold_tree ((fun x -> 0), (fun a -> fun b -> a + b + 1)) t ;;

let nb_leaves_fold = fun t -> fold_tree ((fun x -> 1), (fun a -> fun b -> a + b)) t ;;

let depth_tree_fold = fun t -> fold_tree ((fun x -> 1), (fun a -> fun b -> 1 + if(a > b) then a else b));;

let sum_tree_fold = fun t -> fold_tree ((fun x -> x), (fun a -> fun b -> a + b)) t ;;

(*
10.
*)

let rec swap_tree t = match t with
| Feuille x ->  Feuille x
| Noeud (a,b) -> Noeud (swap_tree b, swap_tree a);;

(*
Non car une feuille n'est pas un noeud.
*)