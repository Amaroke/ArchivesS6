(*1.*)
let fibo n =
  if n = 0 then 0
  else
    let n1 = ref 0 in
    let n2 = ref 1 in
    let i = ref 1 in
    while !i < n do
      let temp = n1 in
      n1 := !n2;
      n2 := !temp + !n2;
      i := !i + 1
    done;
    !n2

(*2.*)
let incrarray array length =
  let i = ref 0 in
  while !i < length do
    array.(!i) <- array.(!i) + 1;
    i := !i + 1
  done;
  array
