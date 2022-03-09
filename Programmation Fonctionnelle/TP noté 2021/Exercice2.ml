(*1.*)
let rec divide_list liste =
  match liste with
  | [] -> ([], [])
  | [ x ] -> ([ x ], [])
  | x :: y :: l ->
      let a, b = divide_list l in
      (x :: a, y :: b)

(*2.*)
let rec merge_int_liste liste1 liste2 =
  match liste1 with
  | [] -> liste2
  | t1 :: q1 -> (
      match liste2 with
      | [] -> liste1
      | t2 :: q2 ->
          if t1 < t2 then (t1 : int) :: merge_int_liste q1 liste2
          else (t2 : int) :: merge_int_liste liste1 q2)

(*3.*)
let rec msort liste =
  match liste with
  | [] -> []
  | [ a ] -> liste
  | _ ->
      let liste1, liste2 = divide_list liste in
      merge_int_liste (msort liste1) (msort liste2)
