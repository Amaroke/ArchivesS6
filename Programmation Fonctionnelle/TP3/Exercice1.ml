(*
Exercice 1 :
*)
let max_option x y = if x = None then y
else if y = None then x 
else if x > y then x
else y;;

let rec max2 l = match l with
| [] -> None
| x::l1 -> max_option x (max2 l1);;

(*
utop # let p = (Some 0)::None::(Some 2)::(Some 3)::(Some 4)::None::(Some 6)::[];;
val p : int option list = [Some 0; None; Some 2; Some 3; Some 4; None; Some 6]
utop # max2 p;;
- : int option = Some 6

Version avec reduce :
*)

let max2reduce p = List.fold_left max_option None p;;