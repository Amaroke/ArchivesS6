(*
1.
*)

type cellule = {
    value: int;
};;

(*
2.
*)

type ldcc = Vide | H of ldcc ref * cellule * ldcc ref;;

(*
3.
*)

let liste_vide = Vide;;

(*
4.
*)

let liste_un_entier = H(ref Vide, {value = 1}, ref Vide);;

(*
5.
*)

let hd_ldcc ldcc = match ldcc with 
Vide -> failwith "La liste est vide"
| H(t, v, q) -> v.value;;

(*
6.
*)

let tl_ldcc ldcc = match ldcc with 
Vide -> failwith "La liste est vide"
| H(t, v, q) -> hd_ldcc !t;;

(*
7.
*)

let rec nth_ldcc ldcc n = match ldcc with
Vide -> failwith "La liste est vide"
| H(t, v, q) -> if n = 0 then v.value else nth_ldcc !q (n-1);;

(*
8.
*)

let hd_ldcc ldcc = match ldcc with 
Vide -> failwith "La liste est vide"
| H(t, v, q) -> v;;

(*
9.
*)

let length_ldcc ldcc = match ldcc with
Vide -> 0
| H(t, v, q) -> let rec aux adresse_cellule cpt ldcc2 = match ldcc2 with
                                                        Vide -> -1
                                                        | H(t2, v2, q2) -> if adresse_cellule = v2 then cpt
                                                                            else aux adresse_cellule (cpt+1) !q2 
                in aux v 1 !q;;

(*
10.
*) 




(*
Tests :
*)

let ldcc1 = H(ref Vide, {value = 1}, ref Vide);;

let ldcc2 = H(ref Vide, {value = 2}, ref Vide);;

let ldcc3 = H(ref Vide, {value = 3}, ref Vide);;

let link1 t q = match t with
Vide -> failwith "Erreur"
| H(p, v, n) -> n := q;;

let link2 q t = match q with
Vide -> failwith "Erreur"
| H(p, v, n) -> p := t;;

link1 ldcc1 ldcc2;;
link1 ldcc2 ldcc3;;
link1 ldcc3 ldcc1;;

link2 ldcc3 ldcc2;;
link2 ldcc2 ldcc1;;
link2 ldcc1 ldcc3;;