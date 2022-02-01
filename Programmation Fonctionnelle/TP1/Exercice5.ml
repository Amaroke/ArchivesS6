
let fibo n =
                else fibo_aux (i-1) a + fibo_aux (i-2) a
        in
        fibo_aux n 0;;

let fibo n =
        let rec fibo_aux i a b =
                if i = 0 then b
                else if i = 1 then a
                else fibo_aux (i-1) (a+b) a
        in
        fibo_aux n 1 0;;

let rec fib2 n = fib1 (n-2) + fib1 (n-3)
and fib1 n = fib2 n + fib2 (n-1)
and fib n = fib2 n + fib1 n;;                else fibo_aux (i-1) a + fibo_aux (i-2) a
        in
        fibo_aux n 0;;

let fibo n =
        let rec fibo_aux i a b =
                if i = 0 then b
                else if i = 1 then a
                else fibo_aux (i-1) (a+b) a
        in
        fibo_aux n 1 0;;

let rec fib2 n = fib1 (n-2) + fib1 (n-3)
and fib1 n = fib2 n + fib2 (n-1)
and fib n = fib2 n + fib1 n;;

