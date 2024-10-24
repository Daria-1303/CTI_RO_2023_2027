(* EX. 1
Scrieți o funcție care ia o listă de asociere cu perechi de tip (șir, întreg) și 
creează un dicționar în care fiecare șir e asociat cu suma tuturor valorilor cu care e asociat în listă.
*)

module M = Map.Make(String);;
module S = Map.Make(Int);;

let lista = [("ana", 1);("are",3);("ana", 4);("are",2);("mere", 7)];;

let ex1 lista = List.fold_left( fun acc (e1,e2) -> if M.mem e1 acc then M.add e1 (M.find e1 acc +e2) acc else M.add e1 e2 acc ) M.empty lista;;

M.bindings (ex1 lista);;

(* EX. 2
Scrieți o funcție care ia o listă de șiruri de caractere și 
creează un dicționar în care fiecare șir e asociat cu numărul aparițiilor din listă
*)

let ex2 lista = List.fold_left( fun acc (e1,e2) -> if M.mem e1 acc then M.add e1 (M.find e1 acc +1) acc else M.add e1 1 acc) M.empty lista;;

M.bindings (ex2 lista);;

(* EX. 3
Implementați cu ajutorul lui fold din modulul Map funcția filter care 
creează un nou dicționar doar cu perechile din dicționarul dat care satisfac o funcție dată.

Documentația specifică tipurile pentru funcțiile fold și filter.
Ele funcționează similar ca pentru mulțimi, 
dar funcția dată ca prim argument are ca parametri atât cheia cât și valoarea intrării curente din dicționar 
(iar pentru fold și acumulatorul pentru rezultat). 
Ordinea parametrilor e aceeași ca la Set: (1) funcția, (2) colecția prelucrată (dicționarul), iar pentru fold și (3) valoarea inițială.
*)

let d = S.add 1 2 ( S.add 2 5 ( S.add 4 7 ( S.add 3 2 ( S.singleton 6 1 ) ) ) );;

S.bindings d;;

let filter conditie dictionar = S.fold ( fun k v acc -> if conditie k v then S.add k v acc else acc ) dictionar S.empty;;

S.bindings ( filter ( fun x y -> x + y <  9 ) d );;

(* EX. 4
Pentru tipurile colecție (liste, mulțimi, dicționare) e util să avem funcții care ne spun 
dacă există un element care satisface o anume condiție, respectiv dacă toate elementele satisfac condiția.

Implementați funcțiile exists și for_all pentru dicționare, folosind fold. 
Ele iau ca parametru o funcție booleană de cheie și valoare (care exprimă condiția) și 
dicționarul în care se face căutarea. (Ele există ca funcții standard, deci puteți vedea tipul lor în documentație).

Încercați să scrieți prelucrarea folosind o excepție pentru a întrerupe parcurgerea 
dacă răspunsul nu mai depinde de restul elementelor (true pentru exists, resp. false pentru for_all). 
În acest caz puteți folosi mai simplu iter. Urmați exemplul cu liste de la curs și din notițe (sec. 5.1).
*)

let exists conditie dictionar = try S.fold ( fun k v acc -> if conditie k v then raise Exit else acc) dictionar false
                                with Exit -> true ;;

exists (fun x y -> x + y < 5) d;;

let for_all conditie dictionar = try S.fold ( fun k v acc -> if not (conditie k v) then raise Exit else acc ) dictionar true
                                  with Exit -> false;;

for_all (fun x y -> x + y < 10) d;;

(* EX. 5
Implementați cu ajutorul lui fold funcția standard map 
care construiește un dicționar în care toate valorile au fost transformate folosind o funcție dată ca parametru.
*)

let map functie dictionar = S.fold ( fun k v acc -> S.add k (functie v) acc ) dictionar S.empty;;

S.bindings ( map ( fun x -> x + 2 ) d);;

(* EX. 6
Scrieți o funcție care primește un dicționar de la șiruri la întregi și o listă de șiruri și 
returnează mulțimea tuturor valorilor din dicționar care corespund șirurilor din listă.

Parcurgeți lista cu List.fold_left. 
Când folosiți find, tratați excepția Not_found pentru a adăuga o valoare la mulțimea-acumulator doar când cheia e găsită în dicționar.
*)

module Int = struct
  type t = int
  let compare = compare
end;;

module Multime = Set.Make(Int);;

let dsir = M.add "ana" 2 ( M.add "mere" 3 ( M.add "ana" 1 ( M.add "mere" 4 ( M.add "are" 7 M.empty) ) ) ) ;;
let lsir = ["ana"; "are"; "multe"; "mere"];;

let ex6 dictionar lista = List.fold_left ( fun acc e -> try Multime.add (M.find e dictionar) acc with Not_found -> acc ) Multime.empty lista;;          

M.bindings dsir;;

Multime.elements ( ex6 dsir lsir );;

(* EX. 7
Scrieți o funcție care primește o funcție și un dicționar și 
returnează maximul valorilor funcției pentru toate intrările dicționarului,
sau generează excepția Not_found pentru un dicționar vid.
Funcția-parametru are ca argumente cheia și valoarea unei intrări, și poate returna valori arbitrare. 
Folosiți fold pentru parcurgere, și max (definită implicit pentru orice tip) pentru a compara valorile returnate de funcția parametru.
*)

let f x y = x + y;;

let ex7 functie dictionar = if S.is_empty dictionar then raise Not_found 
                            else S.fold ( fun k v acc -> max (functie k v) acc ) dictionar 0;;

S.bindings d;;

ex7 f d;;
                         
(* EX. 8
Scrieți o funcție care ia ca parametri două dicționare de la șiruri la șiruri 
reprezentând funcții parțiale f1 și f2 și 
returnează dicționarul care reprezintă f2 ⚪ f1.
*)

let dd = S.add 1 "ana" ( S.add 2 "are" ( S.add 4 "mere" ( S.singleton 5 "multe" ) ) ) ;;

let ex8 d1 d2 = S.fold ( fun k v acc -> if S.mem v d2 then S.add k (S.find v d2) acc else acc ) d1 S.empty;;

S.bindings d;;
S.bindings dd;;
S.bindings ( ex8 d dd );;

(* EX. 9
Scrieți o funcție care ia ca parametru 
un dicționar reprezentând o funcție parțială f de la șiruri la șiruri și 
calculează pentru un șir s numărul maxim n pentru care fn(s) e definit, 
respectiv generează o excepție dacă șirul fn(s) e ciclic (definit pentru orice n).

De exemplu,
 pentru f("a") = "b", 
 f("b") = "c", 
 f("d") = "e", 
 f("e") = "f", 
 f("f") = "e",
  avem depth("x") = 0, depth("a") = 2, depth("b") = 1, iar depth("d") generează excepție (la fel pentru "e" și "f").
Indicație: La parcurgerea pornind de la s rețineți mulțimea tuturor șirurilor deja întâlnite pentru a detecta un eventual ciclu.
*)

let ddd = M.add "a" "b" ( M.add "b" "c" ( M.add "d" "e" ( M.add "e" "f" ( M.add "f" "e" M.empty ) ) ) );;

M.bindings ddd;;

module S = Set.Make(String);;

let depth sir dictionar =
      let rec aux k v contor = 
                              try if S.mem (M.find k dictionar) v 
                                    then failwith "ciclu" 
                                      else aux (M.find k dictionar) (S.add (M.find k dictionar) v) (contor+1) 
      with Not_found -> contor
      in aux sir S.empty 0
;;
depth "x" ddd;;
depth "a" ddd;;
depth "b" ddd;;
depth "d" ddd;;
depth "e" ddd;;
depth "f" ddd;;



