let nb_aleatoire () =
  let r = Random.int 900 in (* r = 0.. 899*)
  r + 100
;;

let gen_cartes_list () =
  let rec loop n acc =
    if n = 0 then
      acc
    else
      loop (n-1) (n::n::acc)
  in
  loop 10 ([25;50;75;100])

let rec n_premiers n l =
    match n, l with
        0, _ -> []
    | m, x :: ll -> x :: (n_premiers (m-1) ll)
    | _, [] -> failwith "Liste trop courte"
;;
let choix cartes =
  let l = List.map (fun c -> (Random.int 1000, c)) cartes in
  let ls = List.sort (fun (a,_) (b, _) -> compare a b) l in
  List.map snd (n_premiers 6 ls)
;;

let retire i j l =
  let rec loop k l =
    match l with
      [] -> []
    | x :: ll -> 
      if k = i || k = j then loop (k+1) ll
      else x :: loop (k+1) ll
   in
   loop 0 l
  ;;

type binop = Add | Sub | Mul | Div
;;
type res = Res of (binop * int * int) * int
      | Invalid
;;

let add a b = Res ((Add, a, b), a + b)
let mul a b = Res ((Mul, a, b), a * b)

let sub a b =
  if a = b then Invalid else
    let a, b =
    if a < b then b, a else a, b
  in
    Res ((Sub, a, b), a - b)
;;
let div a b =
  let a, b = if a < b then b, a else a, b
  in
  if a mod b != 0 then
    Invalid
  else Res ((Div, a, b), a / b)

let op a b =
  List.fold_left (fun acc f ->
    match f a b with
      Res (binop, r) -> (binop, r) :: acc
      | _ -> acc
    ) [] [ add; sub; mul; div ]
  ;;

exception Trouve of ((binop * int * int) * int) list
;;


let recherche cible cartes =
  let rec loop cartes_res op_acc =
    List.iteri (fun i a ->
      List.iteri (fun j b ->
        if i != j then
          let n_cartes_res = retire i j cartes_res in
          let valid_ops = op a b in
          List.iter (fun (binop, r) ->
            let n_op_acc = (binop, r) :: op_acc in
            if r = cible then raise (Trouve n_op_acc)
            else
              loop (r::n_cartes_res) n_op_acc
            ) valid_ops
           ) cartes_res
        ) cartes_res
  in
  loop cartes []
;;

let lceb () =
  Random.self_init ();
  let cible = nb_aleatoire () in
  let cartes = choix (gen_cartes_list ()) in
  Printf.printf "Nombre cible: %d\n" cible;
  Printf.printf "Cartes: ";
  List.iter (fun c -> Printf.printf "%d " c) cartes;
  Printf.printf "\n";
  try
    recherche cible cartes;
    Printf.printf "Pas de solution\n"
  with
    Trouve l ->
      Printf.printf "Solution:\n";
      List.iter (fun ((binop, a, b), r) ->
        Printf.printf " => %d %s %d = %d\n" a (match binop with
        Add -> "+"
        | Sub -> "-"
        | Mul -> "*"
        | Div -> "/")
        b r) (List.rev l)
      ;;

lceb ()
    ;;