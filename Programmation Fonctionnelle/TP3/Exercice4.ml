(*
1.
*)

let rec unfold f i = if f i = None then [] else (match f i with Some(a, b) -> a :: unfold f b);;

(*
2.
*)

let fibo_liste n = unfold (fun (a, b) -> if (a>n) then None else Some(a, (b, a+b))) (0, 1);;