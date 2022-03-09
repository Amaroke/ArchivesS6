(*1*)
let rec partition l p =
  match l with
  | [] -> ([], [])
  | t :: q ->
      let l1, l2 = partition q p in
      if t < p then (t :: l1, l2) else (l1, t :: l2)

(*2*)
let rec tri_rapide l =
  match l with
  | [] -> []
  | t :: l ->
      let l1, l2 = partition l t in
      tri_rapide l1 @ (t :: tri_rapide l2)

(*3*)
