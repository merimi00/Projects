(*_______________________TD1_______________________*)

let div_euc a1 a2 b1 b2 =
    sqrt(  (float_of_int(a1-b1))**2. +. (float_of_int(a2-b2))**2.  )
;;

let () = Printf.printf "%f\n" (div_euc 1 2 2 1)

let f1 x =
    if x mod 2 = 0 then Printf.printf "Pair\n"
    else Printf.printf "Impair\n"
;;
let f2 x =
    Printf.printf "%s\n" (if (x mod 2) = 0 then "Pair" else "Impair")
;;

let f3 x =
    let res =
    if x mod 2 = 0 then "Pair"
    else "Impair"
    in
    Printf.printf "%s\n" res
;;

let rec sum x =
    if x = 0 then 0
    else x + sum (x-1)
;;
let sum x =
    let rec sum_aux x n =
        if x = 0 then n
        else sum_aux (x-1) (n+x)
    in sum_aux x 0
;;

let sum x = match x with
    |0 -> 0
    |n -> n + sum(n-1)
    (*| _ -> -1*)
;;

let even_odd x =
    if x mod 2 = 0 then "Pair"
    else "Impair"
;;

let even_odd2 x =
    if x mod 2 = 0 then true
    else false
;;

let borne_sup x = match x mod 2 with
    |0 -> x/2
    |1 -> (x+1)/2
    | _ -> -1
;;

(*let () = Printf.printf "%d\n" (borne_sup 90)*)

(*_______________________TD2_______________________*)

let rec mult a b =
    if b = 0 then 0
    else if b = 1 then a
    else a + mult a (b-1)
;;

let multTer a b =
    let rec mult_aux a b n =
        if b = 0 then n
        else if b = 1 then a+n
        else mult_aux a (b-1) (a+n)
    in mult_aux a b 0
;;
(*
let () = Printf.printf "%d\n" (mult 1458275 553)
let () = Printf.printf "%d\n" (multTer 1458275 553)
*)
let rec mult_match a b = match b with
    |0 -> 0
    |1 -> a
    | _ -> a + mult_match a (b-1)
;;
(*let () = Printf.printf "%d\n" (mult_match 1458275 553)*)

let mult_match_Ter a b =
    let rec mult_match a b n = match b with
        |0 -> 0
        |1 -> n + a
        | _ -> mult_match a (b-1) (n+a)
    in mult_match a b 0
;;
(*let () = Printf.printf "%d\n" (mult_match_Ter 1458275 55423)*)



(*_______________________devine () est dans guessnb.ml__________________*)


(*____________expo____________*)
let rec exp e n =
  if n = 0 then 1
  else e * exp e (n-1)
;;

(*let () = Printf.printf "%d\n" (exp 3 45);;*)

(*function exp (e, n){
 res = 1
 for i = 0 to n {
  res = res * e
 }
 return res
}   *)

(*let exp e n =
let res = 1 in
let rec loop i res =
if i = n
then res
else loop (i+1) (res * e) in
loop 0 res*)

let exp_Ter e n =
    let untruc = 1 in
  let rec exp e n m =
    if n = 0 then m
    else exp e (n-1) (m*e)
  in exp e n untruc
;;

(*let () = Printf.printf "%d\n" (exp_Ter 3 45)*)


(*____________let ... in____________*)

let rec f x =
  if x <= 2 then 1
  else x + (f (x-1))

(*let () = Printf.printf "%d\n" (f 3)*)

(*function f (a, n) { s=0
 for i = 0 to n { if i mod 2 = 0 then s+=1 else s-=1
 }if a > s then print "%d > %d" a s else print "%d < %d" a s}*)

let compare a s =
  if a > s then (string_of_int a) ^ " > " ^ (string_of_int s)
  else (string_of_int a) ^ " < " ^ (string_of_int s)
;;
let rec f a n s =
  let s = 0 in
  if n mod 2 = 0 then f a (n-1) (s+1)
  else f a (n-1) (s-1)

let f a n =
    let s =
        let rec aux i acc =
            match i with
                    | 0 -> acc
                    | _ -> if i mod 2 = 0 then aux (i-1) (acc+1) else aux (i-1) (acc-1)
                in
                aux n 0
    in
    if a > s then Printf.printf "%d > %d" a s
    else Printf.printf "%d < %d" a s

;;

(*____________nb premiers_________________*)
let rec div_between a b n =
  if (a < b) then 
        if (n mod a) = 0 then true
        else div_between (a+1) b n
  else false
;;
let () = Printf.printf "div_between 2 10 13 %b\n"  (div_between 2 10 13)

let is_prime a =
    if a = 1 then false
    else if ( div_between 2 (a-1) a ) then false
    else true  
;;
let () = Printf.printf "is_prime 22 %b\n" (is_prime 22)

let rec no_div_from a n =
    if a**2 > n then true
    else if (n mod a = 0) then false
    else no_div_from (a+1) n 
;;
let () = Printf.printf "no_div_from 11 2 %b\n" (no_div_from 11 2)
let () = Printf.printf "no_div_from 1 2 %b\n" (no_div_from 1 2)
let () = Printf.printf "no_div_from 2 32 %b\n" (no_div_from 2 32)

let is_prime1 a =
     no_div_from a (a*a) 
;;
let () = Printf.printf "is_prime 11 %b\n" (is_prime 11)
let () = Printf.printf "is_prime 1 %b\n" (is_prime 1)
let () = Printf.printf "is_prime 12 %b\n" (is_prime 12)

(*correction
    let rec div_between a b n =
not (a > b) && (n mod a = 0 || div_between (a+1) b n)

let is_prime n =
n >= 2 && not (div_between 2 (n-1) n)

let rec no_div_from a n =
if a * a > n
then true
else if n mod a = 0
then false
else no_div_from (a+1) n



*)



(*_____________decompositon en binaire________________*)
let rec print_decomp n =
    if n = 0 then ""
    else print_decomp (n/2)^string_of_int(n mod 2)
;;
let () = Printf.printf "print_decomp 23 =  %s\n" (print_decomp 23)

(*
let rec print_decomp n =
match n with
| 0 -> ()
| n -> print_decomp (n/2); Printf.printf "%d" (n mod 2)
*)

(*_____________expo rapidos________________*)

(*

 3 ^ 23 = 3 ^ (1 + 2 + 4 + 0 + 16)                    # décomposition, pas de 8

         = 3 * (3 ^ 2) * (3 ^ 4) * 1 * (3 ^ 16)        # donc 1 à la place de 3 ^ 8

On retient donc une certaine puissance de 3 que l'on met au carré pour obtenir 
la suivante (3 puis 3 ^ 2 puis 3 ^ 4 = (3 ^ 2) * (3 ^ 2) ...). 

*)

let rec exp_rap x n =
    if n = 0 then 1
    else exp_rap x (n mod 2)*x 
;;
let () = Printf.printf "exp_rap 2 3 =  %d\n" (exp_rap 2 3)



let exp e n =
    let rec exp_aux acc pow n =
        if n = 0 then acc
        else 
            if n mod 2 = 1 then exp_aux (pow * acc) (pow * pow) (n / 2)
            else exp_aux acc (pow * pow) (n / 2) 
in exp_aux 1 e n

  

(*_______________________TD3___leap_year.ml__approx_pi.ml__cardioide.ml________mandelbrot.ml________

let year = read_int () ;;

let leap =
  (year mod 4 = 0 && year mod 100 <> 0) || (year mod 400 = 0) ;;

let msg = if leap then "is" else "is not" ;;

Printf.printf "%d %s a leap year\n" year msg ;;



let n = int_of_string Sys.argv.(1);;
  
let rec approx_pi p cpt = 
  if cpt=0 then 4. *. (float_of_int p) /. (float_of_int n)
  else
    let x = Random.float 1. in
    let y = Random.float 1. in
    let c = if x*.x +. y*.y < 1. then 1 else 0 in 
    approx_pi (p+c) (cpt-1);
;;

Printf.printf "%f\n" (approx_pi 0 n);;


open Graphics;;

open_graph " 300x200";;

let rec draw_cardioide i = 
  if i <= 200 then
    begin
      let th = atan 1. *. float i /. 25. in
      let r = 50. *. (1. -. sin th) in
      let x = truncate (r *. cos th) in
      let y = truncate (r *. sin th) in
      lineto (150 + x) (150 + y);
      draw_cardioide (i+1)
    end
;;

moveto 200 150; draw_cardioide 0; read_key ()
;;



open Graphics

let width = 800
let height = 800
let k = 100

let norm2 x y = x *. x +. y *. y

let mandelbrot a b = 
  let rec mandel_rec x y i = 
    if i = k || norm2 x y > 4. then i
    else 
      let x' = x *. x -. y *. y +. a in
      let y' = 2. *. x *. y +. b in
      mandel_rec x' y' (i + 1)
  in


  mandel_rec 0. 0. 0 

let rec draw l h = 
  if l < width then
    if h = height then draw (l + 1) 0
    else
      let a = 4. *. float l /. float width -. 2. in
      let b = 4. *. float h /. float height -. 2. in
      let i = mandelbrot a b in
      if i = k then plot l h;
      draw l (h + 1)
    
let dim = Printf.sprintf " %dx%d" width height;;

open_graph dim; draw 0 0; read_key ();;

*)


(*_______________________TD4_______________________*)




















(*fin de ce petit pro*)
