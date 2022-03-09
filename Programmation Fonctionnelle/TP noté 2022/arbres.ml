(*Exercice 3*)
type arbre = Vide | Noeud of arbre * int * arbre

(*Exercice 4*)
let rec est_croissant a =
  match a with
  | Vide -> true
  | Noeud (Vide, r, Vide) -> true
  | Noeud (Vide, r, Noeud (dg, dr, dd)) ->
      if r < dr then true && est_croissant (Noeud (dg, dr, dd)) else false
  | Noeud (Noeud (gg, gr, gd), r, Vide) ->
      if r < gr then true && est_croissant (Noeud (gg, gr, gd)) else false
  | Noeud (Noeud (gg, gr, gd), r, Noeud (dg, dr, dd)) ->
      if r < gr && r < dr then
        true
        && est_croissant (Noeud (gg, gr, gd))
        && est_croissant (Noeud (dg, dr, dd))
      else false

(*Exercice 5*)
let rec fusion a1 a2 =
  match a1 with
  | Vide -> a2
  | Noeud (g1, r1, d1) -> (
      match a2 with
      | Vide -> a1
      | Noeud (g2, r2, d2) ->
          if r1 < r2 then Noeud (g1, r1, fusion d1 a2)
          else Noeud (fusion a1 g2, r2, d2))

(*Exercice 6*)
let rec insert a n =
  match a with
  | Vide -> Noeud (Vide, n, Vide)
  | Noeud (g, r, d) ->
      if n < r then Noeud (insert g n, r, d) else Noeud (g, r, insert d n)

(*Exercice 7*)
let depile a =
  match a with
  | Vide -> failwith "L'arbre est vide !"
  | Noeud (g, r, d) -> (r, fusion g d)

(*Exercice 8*)
