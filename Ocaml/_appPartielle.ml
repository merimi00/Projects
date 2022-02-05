
lri.fr
typage.ml
3 minutes

  1: let rec f a b c = if c <= 0 then a else f a b (b c);;
  2:
  3: (* Comment trouver le type de f ?
  4:
  5:    On lit la définition de gauche à droite.
  6:
  7:          let rec f a b c = ...
  8:
  9:    Là, on sait maintenant que f a "trois" arguments, c'est-à-dire que
 10:    le type de f est de la forme :
 11:
 12:
 13:    val f : 'a1 -> 'a2 -> 'a3 -> 'a4
 14:
 15:   Comme on ne connait pas les types des trois arguments et du
 16:    résultat, on les représente par 4 variables de type. Ces variables
 17:    sont les inconnues du problème.
 18:
 19:   On continue alors à lire la définition de f.
 20:
 21:           let rec f a b c = if c <= 0 then ... else ...
 22:
 23:   Comme c est comparé à la constante entière 0, on sait maintenant que
 24:    c est de type int. Ce qui nous donne :
 25:
 26:   'a3 = int, soit le type pour f :
 27:
 28:    val f : 'a1 -> 'a2 -> int -> 'a4
 29:
 30:
 31:   On continue:
 32:
 33:           let rec f a b c = if c <= 0 then a else ...
 34:
 35:   On apprend rien sur le type de l'argument a, mais on sait maintenant
 36:    que le type du résultat de la fonction f ('a4) est de même type que
 37:    l'argument a ('a1). Ce qui donne :
 38:
 39:   'a1 = 'a4, soit le type pour f :
 40:
 41:    val f : 'a1 -> 'a2 -> int -> 'a1
 42:
 43:
 44:   On continue:
 45:
 46:   let rec f a b c = if c <= 0 then a else ... (b c);;
 47:
 48:   L'argument b est appliqué à c, donc b est une fonction. Ce qui
 49:    donne:
 50:
 51:   'a2 = 'a5 -> 'a6
 52:
 53:   où 'a5 et 'a6 sont de nouvelles variables de type car on ne connait
 54:    rien pour le moment aux types entrée et sortie de cette fonction.
 55:
 56:   Comme b est appliquée à c, la fonction b prend donc en argument des
 57:    valeurs de même type que c. Ce qui donne :
 58:
 59:   'a5 = 'a3 = int, soit le type pour f :
 60:
 61:    val f : 'a1 -> (int -> 'a6) -> int -> 'a1
 62:
 63:    On continue à lire la branche else:
 64:
 65:    let rec f a b c = if c <= 0 then a else f a b (b c);;
 66:
 67:    De l'application f a b (b c), on apprend que le résultat de (b c)
 68:    doit être de même type que c. Ce qui donne :
 69:
 70:   'a6 = int
 71:
 72:   val f : 'a1 -> (int -> int) -> int -> 'a1
 73:
 74:   On a terminé car nous avons lu toute la définition de la fonction f
 75:    et nous n'avons plus aucune information sur les variables de type restantes.
 76:
 77:  *)
 78:
 79:





  1: let plus x y = x + y
  2:
  3: (* Le type de la fonction plus est int -> int -> int. Avec les
  4:    parenthèses, qui sont implicites quand OCaml affiche le type, cela
  5:    donne :
  6:
  7:    int -> (int -> int)
  8:
  9:   On voit qu'il s'agit d'une fonciton qui attend 1 unique argument de
 10:    type int et qui renvoie ensuite une fonction de type int -> int.
 11:
 12:  *)
 13:
 14: (* En fait, la fonction plus est équivalente à la fonction plus écrite
 15:    de la manière suivante : *)
 16:
 17: let plus = function x -> (function y -> x + y)
 18:
 19: (* De cette manière, on voit bien qu'il as'agit d'une fonction qui
 20:    prend en argument une valeur entière 'x' et qui renvoie la fonction
 21:    (function y -> x + y) *)
 22:
 23: (* Pour s'en convaincre, on va voir plusieurs exemples d'application
 24:    partielle de la fonction plus, c'est-à-dire des applications de la
 25:    forme 'plus v' où on ne donne qu'un seul argument à plus.
 26: *)
 27:
 28: (* La fonction qui à y ajoute 100, c'est-à-dire y -> 100 + y, s'écrit
 29:    naturellement comme une application partielle de la fonction plus.
 30:    L'application partielle de plus renvoie une fonction de type int ->
 31:    int.  *)
 32:
 33: let plus100 = plus 100
 34: let () = print_int (plus100 42)
 35:
 36: (* De la même manière, la fonction qui à y ajoute 5, c'est-à-dire y ->
 37:    5 + y, s'écrit aussi comme une application partielle de la fonction
 38:    plus *)
 39:
 40: let plus5 = plus 5
 41: let () = print_int (plus5 42)
 42:
 43: (* Une application partielle calcule la nouvelle fonction à renvoyer à
 44:    l'exécution du programme. Par exemple, pur s'en convaincre, la
 45:    fonction suivante plus_random ajoute à y une valeur entière
 46:    aléatoire qui est calculée à l'exécution *)
 47:
 48: let plus_random = plus (Random.int 10)
 49: let () = print_int (plus_random 42)
 50:
 51: (* Pour ceux qui douteraient encore, la fonction suivante *)
 52:
 53: let plus_utilisateur = plus (read_int())
 54: let () = print_int (plus_utilisateur 42)
 55:
 56:
 57:
