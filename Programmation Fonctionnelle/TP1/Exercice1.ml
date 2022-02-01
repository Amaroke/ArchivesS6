(*
1.1.
*)
let incr x = x+1;;
let incr = fun x -> x+1;;

(*
1.2.
*)
let avg x y = (x+y)/2;;
let avg = fun x -> fun y -> (x+y)/2;;

(*
1.3.
*)
(avg 2) 6;;