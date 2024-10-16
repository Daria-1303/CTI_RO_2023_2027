(*
scrieti o functie recursiva care ia ca parametri 2 intregi a si b,
 si o functie cond : Z -> {true, false}, si returneaza produsul acelor intregi x din intervalul [a,b] 
 pentru care cond(x) e adevarata.
*)

let prod a b cond = 
  let rec aux a b cond produs = match b with
  | final when b<a -> produs
  | _ -> if cond b then aux a (b-1) cond b*produs else aux a (b-1) cond produs
  in aux a b cond 1;;

prod 2 8 (fun x -> x mod 2 = 0);;

(*
scrieti o functie care ia ca parametru o lista de intregi si o functie cond: Z -> {true, false}, si, folosind 
recursivitatea si descompunerea cu ajutorul tiparelor, returneaza true daca toate elementele din lista indeplinesc
conditia cond(x), false altfel.
*)

let forall lista cond = 
  let rec aux lista cond rez = match lista with
  | [] -> rez
  | h::t -> if (cond h=false) then aux t cond (not rez) else aux t cond rez
  in aux lista cond true;;
forall [1;2;3;4] (fun x -> x<4);;

(*
scrieti o functie care ia ca parametru o lista de intregi si un numar natural n, si, folosind
o functie de parcurgere, returneaza o noua lista care, pentru fiecare intreg x din lista initiala
contine o pereche (catul impartirii lui x la n, restul impartirii lui x la n).
*)

let impartire lista numar = List.fold_left (fun acc e -> ((e mod numar),(e/numar)) ::acc ) [] lista ;;
impartire [2;4;5;6;7] 2;;

(*
scrieti o functie care sa ia 3 parametri, o functie f: Z -> Z si 2 multimi de nr intregi, si returneaza
o multime care contine elementele comune celor 2 multimi, transformate de functia f
*)

module S = Set.Make(Int);;

let comune f m1 m2 = S.fold (fun e acc -> if S.mem e m2 then S.add (f e) acc else acc) m1 S.empty;;
S.elements (comune (fun x -> x+2) (S.of_list[1;2;3;4]) (S.of_list[2;4;5;7]));;

(*
scrieti o functie care ia ca parametru un dictionar d cu chei si valori numere intregi, 
si o functie cond: Z x Z -> {true, false}, si returneaza un dictionar care contine doar 
asocierile cheie-valoare din dictionarul initial care indeplinesc conditia data, dar cu 
cheia si valoarea schimbate intre ele
*)

module I = Map.Make(Int);;
let int_map = I.add 6 2 (I.add 3 2 ( I.add 1 6 ( I.add 2 1 I.empty ) ) );;
let conditie x y = if (x>2 && y>1) then true else false;;

let schimb d cond = I.fold (fun k v acc -> if (cond k v) then (I.add v k acc) else acc) d I.empty;;
I.bindings int_map;;
I.bindings (schimb int_map conditie);;

(*
scrieti o functie recursiva care ia ca parametru un arbore cu informatia din noduri
numere intregi, si un numar intreg n, si returneaza un nou arbore, identic cu cel initial, 
dar din care a fost sters subarborele cu radacina n, daca exista.
*)

type 'a bintree = Nil | T of 'a bintree * 'a * 'a bintree;;

let problema3 t n = 
  let rec intern t = match t with
  | Nil -> Nil
  | T(st, rad, dr) when rad = n -> Nil
  | T(st, rad, dr) -> T(intern st, rad, intern dr)
  in intern t;;

(*
Sa se scrie o functie care ia ca parametru o lista de numere intregi si o functie f: Z->Z
si returneaza o pereche de multimi astfel incat in multimea aflata pe prima pozitie a perechii sa se afle numerele din lista,
iar in multimea de pe a doua pozitie a perechii toate valorile obtinute aplicand functia f elementelor.

Util:
module Integer = struct
  type t = int
  let compare = compare
end;;

module IS = Set.Make(Integer);;
*)

module IS = Set.Make(Int);;

let permult lista f = List.fold_right (fun e (acc1, acc2) -> (IS.add e acc1, IS.add (f e) acc2) ) lista (IS.empty, IS.empty);;
let (r1,r2) = permult [1;2;3;4;5;6] (fun x -> x+2);;
IS.elements r1;;
IS.elements r2;;

(*
Reprezentati o functie recursiva care ia ca parametru o functie f:Z->Z, un numar natural n si un numar intreg x 
si returneaza valoarea functiei aplicate de n ori in x.
*)

let aplicare f n x = 
  let rec aux f n x fnou = match n with
  | 0 -> fnou
  | _ -> aux f (n-1) x (f fnou)
  in aux f n x x;;
aplicare (fun x -> x+1) 3 0;;

(*
Sa se scrie o functie in OCaml care ia ca parametru un dictionar cu chei si valori numere intregi si o functie f:Z->z
si returneaza un dictionar in care fiecarei chei k din dictionarul initial ii este asociat rezultatul f(k,v).
*)

module M = Map.Make(Int);;

let asociere dictionar f = M.fold(fun k v acc -> M.add k (f k v) acc) dictionar M.empty;;
M.bindings int_map;;
M.bindings(asociere int_map (fun x y -> x + y - 1));;
