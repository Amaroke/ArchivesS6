(*
1.
*)
let rec mylength = function 
| [] -> 0
| x::l -> 1 + mylength l;;

let mylengthreduce l = List.fold_left (fun acc y -> 1 + acc) 0 l;;
(*
2.
*)
let myhd = function
| [] -> 0
| x::l -> x;;

let myhdreduce l = List.fold_right (fun y acc -> y) l 0;;
(*
3.
*)
let myhd2 = function
| [] -> None
| x::l -> Some x;;

let myhd2reduce l = List.fold_right (fun y acc -> (Some y)) l (Some 0);;
(*
4.
*)
let myhd3 = function
| [] -> failwith "Liste vide !"
| x::l -> x;;
(*
5.
*)
let mytl = function
| [] -> []
| x::l -> l;;
(*
6.
*)
let mytl2 = function
| [] -> None
| x::l -> Some l;;
(*
7.
*)
let mytl3 = function
| [] -> failwith "Liste vide !"
| x::l -> l;;
(*
8.
*)
let rec myappend l1 l2 = match l1 with
| [] -> l2
| x::l1 -> x :: myappend l1 l2;;
(*
9.
*)
let rec mynth l n =
if n = 0 then match (l) with 
| [] -> failwith "L'element n'existe pas !"
| x::l -> x
else match (l) with
| [] -> failwith "L'element n'existe pas !"
| x::l -> mynth l (n-1);;
(*
10.
*)
let myrev l = 
  let rec aux acc l = match l with
   | [] -> acc
   | x::l -> aux (x::acc) l
in aux [] l;;