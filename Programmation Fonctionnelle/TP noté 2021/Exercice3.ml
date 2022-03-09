(*1.*)
type abr = Feuille | Noeud of abr * int * abr

let a1 =
  Noeud
    ( Noeud (Feuille, 2, Feuille),
      3,
      Noeud (Noeud (Feuille, 4, Feuille), 5, Noeud (Feuille, 7, Feuille)) )

(*2.*)
let rec size a =
  match a with Feuille -> 0 | Noeud (x, _, y) -> 1 + size x + size y

(*3.*)
let rec height a =
  match a with
  | Feuille -> -1
  | Noeud (x, _, y) -> 1 + max (height x) (height y)

(*4.*)
let rec search a n =
  match a with
  | Feuille -> false
  | Noeud (_, x, _) when x = n -> true
  | Noeud (g, x, d) -> if n < x then search g n else search d x

(*5.*)
let rec insert a n =
  match a with
  | Feuille -> Noeud (Feuille, n, Feuille)
  | Noeud (g, x, d) ->
      if n < x then Noeud (insert g n, x, d) else Noeud (g, x, insert d n)

(*6. Je capte pas comment ça marche /ff*)
