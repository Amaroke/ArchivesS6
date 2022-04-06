open Miniml.Eval

let print_res x =
  try
    print_string ("testing " ^ x ^ "\nRésultat: ");
    x |> expr_from_string |> delete_pairs |> eval_ocaml |> string_from_expr |> print_string;
    print_string "\n"
  with NotImplemented x ->
    print_string "Pas encore fait, ligne ";
    print_int x;
    print_string "\n"
;;

print_res "let x = 1  in x + 1";;

print_string "\n";
print_res "if 1 = 1 then 2 else 3"
;;

print_string "\n";
print_res "if false then 2 else 3"
;;

print_string "\n";
print_res "1,2"
;;

print_string "\n";
print_res "let x = 2 in let y=x, (x+1) in (fst y) + (snd y) "
;;

print_string "\n";
print_res "[]"
;;

print_string "\n";
print_res "[1]"
;;

print_string "\n";
print_res "1 :: []"
;;

print_string "\n";
print_res "1 :: []"
;;

print_string "\n";
print_res "match [1;2] with [] -> 0 | x::l -> x"
;;

print_string "\n";
print_res "(tee 3) + (tee 4)"
;;

print_string "\n";
print_res "raise 1"
;;

print_string "\n";
print_res "try raise 1 with x -> x+1"
;;

print_string "\n";
print_res "3 < 4"
;;

print_string "\n";
print_res "3 > 4"
;;

print_string "\n";
print_res "let rec f = fun n -> if n < 2 then 1 else f (n-1) + f (n-2) in f 5"
;;

print_string "\n";
print_res "let x = 1  in let x = x + x + x in x + x"
;;

print_string "\n";
print_res "let t = tee in (t 3) < (t 9)"
;;

print_string "\n";
print_res "try tee(3) with x -> x+1"

