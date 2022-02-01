(*
1.
*)
let curry f = fun a -> fun b -> f (a,b);;
(*
2.
*)
let decurry f = fun (a,b) -> f a b;;