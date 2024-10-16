(*
Asemănător cu funcțiile din notițele de curs care construiesc lista cifrelor unui număr natural, scrieți:

a) funcții care construiesc lista cifrelor unui număr care satisfac o condiție anume 
(cifre impare, pare, mai mici decât 7, etc. la alegere), în ordine normală și inversă

b) o funcție care construiește lista cifrelor unui număr care satisfac o condiție dată ca parametru sub forma unei funcții cu tipul int -> bool.

c) Invers, dată fiind o listă de cifre, construiți numărul format doar din cifrele care respectă o condiție 
(dată ca parametru funcție cu tipul int -> bool). 
Rezolvați problema direct, recursiv, și apoi prin compunerea lui List.filter (selectarea cifrelor) cu List.fold_left (pentru construirea numărului).
*)

let a_normal numar conditie = 
  let rec aux numar conditie lista = match numar with
  | notok when (numar<0 || conditie (numar mod 10) = false) -> lista
  | _ -> aux (numar/10) conditie ((numar mod 10) :: lista)
  in aux numar conditie [];;
a_normal 1234 (fun x -> x > 2 );;

let a_invers numar conditie = 
  let rec aux numar conditie lista = match numar with
  | notok when (numar<0 || conditie (numar mod 10) = false) -> List.rev lista
  | _ -> aux (numar/10) conditie ((numar mod 10) :: lista)
  in aux numar conditie [];;
a_invers 1234 (fun x -> x > 2 );;

let c lista conditie = 
  let rec aux lista conditie numar = match lista with
    | [] -> numar
    | h::t -> if conditie h = true then aux t conditie (numar*10+h) else aux t conditie numar
  in aux lista conditie 0;;

c [1;2;3;4] (fun x -> x > 1);;

(*
Asemănător cu funcția fromto (din notițele de curs) 
care generează lista numerelor întregi dintr-un interval dat, 
scrieți o funcție care creează lista tuturor întregilor dintr-un interval dat, divizibili cu o valoare dată d.
Indicație: Găsiți cel mai mare număr divizibil din interval, și continuați pas cu pas.
*)

let fromto_d a b d = 
  let rec aux a b d lista = match b with
  | final when b<a -> lista
  | _ -> if (b mod d = 0) then aux a (b-1) d (b::lista) else aux a (b-1) d lista 
  in aux a b d [];;
fromto_d 2 6 2;;

(*  
a) Implementați funcția List.nth care returnează al n-lea element dintr-o listă.
Observați întâi în interpretor comportamentul funcției standard pentru valori ale lui n invalide (negative) sau prea mari 
(mai mari decât lungimea listei). Puteți produce excepția Invalid_argument mesaj apelând funcția 
invalid_arg mesaj, și excepția Failure mesaj apelând funcția failwith mesaj.

b) Implementați o funcție firstn care returnează o listă cu primele n elemente dintr-o listă dată.
*)

let nth lista n = 
  let rec aux lista n k = match lista with
  | [] -> []
  | h::t -> if k = n then [h] else aux t n (k+1) 
  in aux lista n 1;;
nth [2;5;7;3;9] 3;;

let firstn lista n = 
  let rec aux lista n k lnoua = match lista with
  | [] -> List.rev lnoua
  | h::t -> if k<=n then (aux t n (k+1) (h::lnoua)) else (aux t n (k+1) lnoua)
  in aux lista n 1 [];;
firstn [2;3;6;4;8;9] 2;;

(*
a) Implementați funcția List.filter folosind List.fold_right, urmând exemplul dat pentru List.map .

b) Implementați funcția List.exists care determină (returnează adevărat/fals) dacă există un element din listă care satisface o condiție 
(o funcție de element cu valoare booleană, dată ca parametru).
Implementarea poate fi asemănătoare cu cea a funcției mem de la curs. Puteți apoi exprima List.mem folosind List.exists ?
*)

let filter lista conditie = List.fold_right(fun e acc -> if conditie e then e::acc else acc) lista [];;

let exists lista conditie = List.fold_left(fun acc e -> if conditie e then (not acc) else acc) false lista;;
exists [1;2;3;4;5] (fun x -> x mod 7 = 0);;

(*
a) Implementați folosind List.fold_left o funcție countif care ia ca parametru o funcție 
f cu valori boolene și o listă și returnează numărul de elemente pentru care funcția f e adevărată.

b) Implementați similar o funcție sumif care calculează suma tuturor elementelor (presupuse întregi) pentru care funcția f e adevărată.
*)

let countif f lista = List.fold_left (fun acc e -> if f e then acc+1 else acc) 0 lista;;
countif (fun x -> x mod 2 = 0) [1;2;3;4];;

let sumif f lista = List.fold_left (fun acc e -> if f e then acc+e else acc) 0 lista;;
sumif (fun x -> x mod 2 = 0) [1;2;3;4];;

(*
Implementați funcțiile List.split și List.combine care transformă o listă de perechi într-o pereche de liste, și invers.
Indicații: urmăriți din modulul List tipurile pe care trebuie să le aibă cele două funcții.

Scrieți tipare care combină liste și perechi, de exemplu (h1::t1, h2::t2) se potrivește cu o pereche de liste, ambele nevide. 
(a,b)::t identifică prima pereche dintr-o listă nevidă de perechi.

Pentru funcția split, va trebui să folosiți rezultatul apelului recursiv, adică o pereche de două liste. 
Și în let se pot folosi tipare: let (l1, l2) = split t in ..
.
Pentru funcția combine, care ia două argumente, le puteți combina pentru a folosi potrivirea de tipare pe perechi: 
let rec combine l1 l2 = match (l1, l2) with ...
*)

let split l = List.fold_left ( fun (l1,l2) (a1,b1) -> (a1::l1,b1::l2) ) ([],[]) (List.rev l);;
split [(1,2);(3,4)];;
List.split [(1,2);(3,4)];;

let combine (l1,l2) =
  let rec aux (l1,l2) l = match (l1,l2) with
    | ([],[]) -> l
    | ([],h2::t2) -> aux ([],t2) l
    | (h1::t1,[]) -> aux (t1,[]) l
    | (h1::t1,h2::t2) -> (h1,h2) :: (aux (t1,t2) l)
  in aux (l1,l2) [];;

combine ([1;3],[2;4]);;

(*
Implementați funcția List.partition care ia ca parametru o funcție cu valori boolene 
și o listă și returnează o pereche de liste, cu elementele care satisfac, respectiv nu satisfac funcția f.

# List.partition (fun x -> x >= 5) [4;6;7;5;4;8;9] ;;
- : int list * int list = ([6; 7; 5; 8; 9], [4; 4])

Puteți să o scrieți cu una din prelucrările standard? Va fi final recursivă sau nu ?
Indicație: la fiecare pas, elementul curent se adaugă la una din listele din perechea-rezultat.
*)

let partition functie lista = List.fold_left (fun (acc1,acc2) e -> if functie e then (e::acc1,acc2) else (acc1, e::acc2)) ([],[]) lista;;
partition (fun x -> x mod 2 = 0) [1;2;3;4;5];;
List.partition (fun x -> x mod 2 = 0) [1;2;3;4;5];;

(*
Scrieți o funcție care ia o listă de cifre și returnează valoarea numărului cu cifrele respective.
*)

let fromlisttonumber lista = List.fold_left (fun acc e -> acc*10+e) 0 lista;;
fromlisttonumber [1;2;3];;

(*
Scrieți o funcție care elimină duplicatele consecutive: 
ia ca parametru o listă și construiește o listă în care toate secvențele de elemente consecutive egale au fost înlocuite cu un singur element.
Indicație: puteți identifica prin tipar fragmente cu două elemente egale: e1 :: e2 :: t when e1 = e2
*)

let elimdupl lista = 
  let rec aux lista noua = match lista with
  | [] -> List.rev noua
  | [h] -> aux [] (h::noua)
  | h1::h2::t -> if h1 = h2 then aux (h2::t) noua else aux (h2::t) (h1::noua)
  in aux lista [];;
elimdupl [1;1;2;2;3;3;4];;

(*
Scrieți o funcție care interclasează două liste, fiecare ordonată crescător, adică returnează lista cu elementele din ambele liste, ordonate.
Comparați primele elemente din ambele liste pentru a decide care va fi primul în rezultat, și apoi continuați cu listele rămase. 
Puteți da funcției ca parametru o pereche de două liste (l1, l2) și folosi un tipar pentru ambele elemente ale perechii:
let rec merge = function
  | (h1 :: t1, h2 :: t2) -> if h1 < h2 then ...
  | ... alte cazuri ... -> ...
*)

let inter l1 l2 = 
  let rec aux l1 l2 lista = match (l1,l2) with
  | ([],[]) -> List.rev lista
  | ([], h2::t2) -> aux [] t2 (h2::lista)
  | (h1::t1, []) -> aux t1 [] (h1::lista)
  | (h1::t1, h2::t2) -> if h1<h2 then (aux t1 (h2::t2) (h1::lista)) else (aux (h1::t1) t2 (h2::lista))
  in aux l1 l2 [];; 
inter [1;3;5;7] [2;4;6;8];;

(*
Scrieți o funcție care desparte o listă în două liste a căror lungime diferă cu cel mult 1, 
punând alternativ câte un element în fiecare din liste. (Funcția va returna o pereche de liste).
*)

let desparte lista = 
  let rec aux lista k (l1,l2) = match lista with
  | [] -> (List.rev l1, List.rev l2)
  | h::t -> if k mod 2 = 0 then aux t (k+1) (h::l1, l2) else aux t (k+1) (l1, h::l2)
  in aux lista 0 ([],[]);;
desparte [1;2;3;4;5];;

module IS = Set.Make(Int);;

let partitionare cond multime = IS.fold (fun e (acc1, acc2) -> if cond e then (e::acc1, acc2) else (acc1, e::acc2) ) multime ([],[]);;

let (r1,r2) = partitionare ( fun x -> x mod 2 = 0) (IS.of_list[1;2;3;4;5;6]);;

r1;;
r2;;
