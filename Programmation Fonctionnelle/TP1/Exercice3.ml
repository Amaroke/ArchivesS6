let fact n =
    let rec fact_aux i accu =
            if i = 0 then accu
            else fact_aux (i-1) (accu * i)
    in
    fact_aux n 1;;