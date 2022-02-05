

Random.self_init ()

let nb = Random.int 20;;

let rec devine () cpt =
  let m = read_int() in
  if m = nb then
    Printf.printf "%s\n" "Congratulation, you guessed the ramdom number!"
  else if (cpt > 5) then  Printf.printf "%s\n" "cheh fik hehehe tas pas trouvé"
  else if m < nb then
    begin Printf.printf "%s, %d\n" "the number is greater" cpt; devine () (cpt+1) end
  else
    begin Printf.printf "%s, %d\n" "the number is smaller" cpt; devine () (cpt+1) end
;;
let m = read_int()
let () = devine () 0
(*let () = Printf.printf "%s\n" devine m;;*)


(*fin de ce petit programme*)


(* avec limite de coups *)
let cpt_max = 5
let rec devine cpt =
  if cpt > cpt_max then
    Printf.printf "Tu n'as pas r ́eussi `a trouver le bon nombre en moins de %d coups. Il s'agissait de %d.\n" cpt_max goal
  else
    let nb = Printf.printf "Nombre ? "; read_int () in
    if nb < goal then
      (Printf.printf "Plus grand (il te reste %d tentatives)\n" (cpt_max-cpt); devine (cpt + 1))
    else if nb > goal then
      (Printf.printf "Plus petit (il te reste %d tentatives)\n" (cpt_max-cpt); devine (cpt+1))
    else
      Printf.printf "Bien jou ́e, tu as trouv ́e le bon nombre (%d) en %d coups!\n" goal cpt
let () = devine 1