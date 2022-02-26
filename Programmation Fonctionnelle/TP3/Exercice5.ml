(*
1.
*)

let min x y = if x > y then y else x;;

let rec vraimin l = match l with
|[x] -> x
|t::q -> max t (vraimin q)
|[] -> failwith "Liste vide !";;

(*
2.
*)

let rec delete_list x l = match l with
|[] -> []
|t::q -> if t = x then q else t::(delete_list x q) ;; 

(*
3.
*)

let ssort li = unfold (fun aux -> if aux == [] then None else  Some (vraimin aux, delete_list (vraimin aux) aux)) li;;