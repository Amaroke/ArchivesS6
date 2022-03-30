(*
Exercice 1 :
1.
*)
type int_tree = Feuille of int | Noeud of int_tree * int_tree

(*
2.
*)
let rec tree_mem n t =
  match t with
  | Feuille f -> if n = f then true else false
  | Noeud (g, d) -> tree_mem n g || tree_mem n d

(*
3.
*)
exception Trouve

let rec tree_mem_aux n t =
  try
    let rec aux n t =
      match t with
      | Feuille f -> if n = f then raise Trouve else false
      | Noeud (g, d) -> aux n g || aux n d
    in
    aux n t
  with
  | Trouve -> true
  | _ -> false

(*
4.
*)
let rec creer_arbre n =
  if n > 0 then Noeud (creer_arbre (n / 2), creer_arbre (n / 2)) else Feuille 0

let time f n t =
  let time = Sys.time () in
  let fx = f n t in
  Printf.printf "Execution time: %fs\n" (Sys.time () -. time);
  fx

(* Tests :
   time tree_mem 10 arbre_test;;
   Execution time: 0.033406s

   time tree_mem_aux 10 arbre_test;;
   Execution time: 0.081936s

   time tree_mem 0 arbre_test;;
   Execution time: 0.000008s

   time tree_mem_aux 0 arbre_test;;
   Execution time: 0.000010s
*)

(*
Exercice 2 :
1.
*)
let rec tree_mem_result n t =
  let rec aux n t =
    match t with
    | Feuille f -> if n = f then Error true else Ok false
    | Noeud (g, d) -> (
        match (aux n g, aux n d) with
        | Error y, _ -> Error true
        | _, Error y -> Error true
        | Ok x, Ok y -> Ok false)
  in
  match aux n t with Error y -> y | Ok x -> x

(*
2.
time tree_mem_result 0 arbre_test;;
Execution time: 0.047368s

Exercice 3 :
*)
let result_bind res fon = match res with Ok x -> fon x | Error y -> res

(*
Exercice 4 :
*)
let rec fact_cps f n = if n = 0 then f 1 else fact_cps (fun x -> f n * x) (n - 1)
