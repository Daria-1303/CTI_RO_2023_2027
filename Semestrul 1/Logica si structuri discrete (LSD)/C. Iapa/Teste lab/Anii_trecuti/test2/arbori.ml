(* EX. 1
 Lista nodurilor 

a) Scrieți o funcție care construiește lista nodurilor unui arbore binar, enumerate în 
  i) preordine; 
  ii) inordine; 
  iii) postordine.
Tratați tipurile: 
  1) arbore binar oarecare;
  2) arbore strict binar

b) Scrieți o funcție care ia un arbore binar și 
returnează lista nodurilor care au un singur fiu. 
Ordinea nodurilor în listă va fi cea din traversarea în inordine.

Indicații 
Pentru eficiență, folosiți o funcție ajutătoare care 
adaugă lista nodurilor unui arbore (în ordinea indicată) la o listă dată (NU concatenați liste).
Funcția va avea deci aceeași structură ca la traversări, 
doar cu o listă acumulată în loc de număr (primește o listă și un arbore, și returnează o listă).
Cum adăugarea se face simplu la capul listei, 
veți parcurge arborele invers față de cum doriți să apară elementele în listă 
(de exemplu, în postordine pentru a obține rădăcina ca prim element).
*)

(*

                     (6)
                     /\
                    /  \
                  /     \
                 /       \
                /         \
              (5)        (12)
             / \       /      \
          (2)  (3)   (9)     (15)
          / \   \    / \     / 
        (0)(1) (4) (7)(10) (14)
                    \       /
                    (8)   (13)        

PREORDINE: 
    RADACINA
    SUBARBORE STANG
    SUBARBORE DREPT

6 -> 5 -> 2 -> 0 -> NIMIC 
            -> 1 -> NIMIC
       -> 3 -> NIMIC
            -> 4 -> NIMIC
  -> 12 -> 9 -> 7 -> 8 -> NIMIC
             -> 10 -> NIMIC
        -> 15 -> 14 -> 13 -> NIMIC

=> 6 5 2 0 1 3 4 12 9 7 8 10 15 14 13


INORDINE:
    SUBARBORE STANG
    RADACINA
    SUBARBORE DREPT

=> 0 2 1 5 3 4 6 7 8 9 10 12 15 14 13


POSTORDINE:
  SUBARBORE STANG
  SUBARBORE DREPT
  RADACINA

=> 0 1 2 4 3 5 8 7 10 9 13 14 15 12 6

*)

type 'a tree = T of 'a * 'a tree list;;

type 'a bintree = Nil | BT of 'a bintree * 'a * 'a bintree;;

let concat l1 l2 = List.fold_right ( fun e acc -> e::acc ) l1 l2;;

let binary = BT( BT( BT( BT( Nil, 0, Nil ), 2, BT( Nil, 1, Nil ) ), 5, BT( Nil, 3, BT( Nil, 4, Nil )) ), 
            6, 
            BT( BT( BT( Nil, 7, BT( Nil, 8, Nil ) ), 9, BT( Nil, 10, Nil ) ), 12, BT( BT( Nil, 14, BT( Nil, 13, Nil ) ), 15, Nil ) ) );;

(* a) *)

let rec preorder bt = match bt with
  | Nil -> []
  | BT(l,n,r) -> n :: (concat (preorder l) (preorder r));;

preorder binary;;

let rec inorder bt = match bt with
  | Nil -> []
  | BT(l,n,r) -> concat (inorder l) (n :: inorder r);;

inorder binary;;

let rec postorder bt = match bt with
  | Nil -> []
  | BT(l,n,r) -> concat (postorder l) (concat (postorder r) [n]);;

postorder binary;;

(* b) *)

let rec single bt= match bt with
  | Nil -> []
  | BT(l, n, Nil) when l <> Nil -> n :: (single l)
  | BT(Nil, n, r) when r <> Nil -> n :: (single r)
  | BT(l, n, r) -> concat (single l) (single r);;

single binary;;

(* EX. 2
Modificați funcțiile de parcurgere așa încât să funcționeze pe arbori oarecare (fiecare nod are o listă de fii). 
Folosiți funcții de parcurgere pe liste. 
Pentru inordine, parcurgeți întâi capul listei, apoi rădăcina și coada listei.

Indicații: 
Folosiți unul din tipurile generale pentru arbori (nu neapărat binari) de la curs. 
Funcțiile de traversare de la curs au doi parametri: primul număr disponibil pentru etichetare, și arborele. 
Ele returnează următorul număr disponibil pentru etichetare. 
Deci ele pot fi folosite direct ca funcție în List.fold_left pe o listă de subarbori: rezultatul funcției e intrare pentru următorul element 
(arbore) din listă.
*)

let oarecare = T (  1, [ T(2,   [ T (5,[]) ; T(6,[]) ] )   ; T(3,[]) ; T(4, [T( 7, [])]) ] );;

let rec preorder_oarecare arbore = match arbore with
  | T(r, []) -> [r]
  | T(r,h :: t) -> r :: concat (preorder_oarecare h) (List.fold_left (fun acc e -> concat acc (preorder_oarecare e)) [] t);;

preorder_oarecare oarecare;;

let rec inorder_oarecare arbore = match arbore with
  | T(r,[]) -> [r]
  | T(r, h::t) -> concat (inorder_oarecare h) (r :: List.fold_left(fun acc e -> concat acc (inorder_oarecare e)) [] t);;

inorder_oarecare oarecare;;

let rec postorder_oarecare arbore = match arbore with
  | T(r,[]) -> [r]
  | T(r, h::t) -> concat (postorder_oarecare h) (concat (List.fold_left(fun acc e -> concat acc (postorder_oarecare e)) [] t) [r]);;

postorder_oarecare oarecare;;

(* EX. 3
Scrieți o funcție care afișează un arbore de întregi în 
a) preordine; 
b) inordine, 
câte un nod pe linie, precedând valoarea din nod cu un număr de spații egal cu dublul adâncimii la care se află 
(câte două spații pentru fiecare nivel).
*)

open Printf
       
let rec afisare n p = if(p==0)then(printf "%d\n" n )else( printf("  ") ; afisare n (p-1));;

let printd =                         
  let rec aux d = function
    | Nil -> ()
    | BT (left, v, right) -> afisare v d;
                             aux (d+1) left; aux (d+1) right
  in aux 0;;

printd binary;;

let preor =
  let rec aux d = function
    | Nil -> ()
    | BT(l,n,r) -> aux (d+1) l; 
                   afisare n d;
                   aux (d+1) r
  in aux 0;;

preor binary;;

(* EX. 4
Scrieți o funcție care determină dacă un arbore este un arbore binar de căutare: 
pentru fiecare nod, subarborele stâng conține doar valori mai mici, iar cel drept, doar valori mai mari.

Indicație: Folosiți o funcție auxiliară care verifică dacă toate nodurile unui arbore sunt într-un anumit interval (posibil nelimitat la un capăt).
Puteți folosi de exemplu următoarele funcții ajutătoare care lucrează cu valori opționale 
(None având aici rol de 'nelimitat') și verifică dacă o pereche e ordonată crescător, respectiv apartenența unei valori la un interval:

let less = function
  | (None, _) | (_, None) -> true
  | (Some v1, Some v2) -> v1 < v2
     
let between x (a, b) = less (a, x) && less (x, b)
Exemple: between (Some 5) (Some 3, Some 7) sau between (Some 5) (None, Some 8)
Apelați inițial verificarea cu (None, None) (nu se impun limite pentru rădăcină) și impuneți apoi pentru fiecare subarbore limite mai stricte, ținând cont de cele anterioare și de valoarea rădăcinii.
*)

let ex4 bt = 
  let rec cresc l = match l with
  | [] -> true
  | h::[] -> true
  | h1::h2::t when h1=h2 -> false
  | h1::h2::t when h1>h2 -> false
  | h1::h2::t -> cresc (h2::t) 
  in
    if cresc (inorder bt) then true else false;;

ex4 binary;;

(* EX. 5
Scrieți o funcție care ia ca parametru o valoare și un arbore binar de căutare și 
returnează arborele din care valoarea a fost eliminată (dacă exista).

Indicație: Dacă valoarea e într-un nod cu doi descendenți, 
va trebui fie să o înlocuiți cu maximul arborelui stâng sau minimul arborelui drept (după preferință), 
sau să inserați un subarbore într-un loc gol (fiu inexistent) în alt arbore.
*)

let valoare = function
   | BT(_, v, _) -> v
   | Nil -> 0;;

let rec inlocuire arbore = match arbore with
  | Nil -> Nil
  | BT(Nil,n,Nil) -> Nil
  | BT(l,n,Nil) -> BT(inlocuire l, valoare l, Nil)
  | BT(Nil,n,r) -> BT(Nil, valoare r, inlocuire r)
  | BT(l,n,r) -> BT(inlocuire l, valoare l, r);;

let rec eliminate nod arbore = match arbore with
  |Nil -> Nil
  |BT(Nil,n,Nil) -> if nod = n then Nil else BT(Nil,n,Nil)
  |BT(l,n,r) as t -> if nod = n then inlocuire t  else BT((eliminate nod l), n, (eliminate nod r));;

eliminate 13 binary;;

(* EX. 6
O mulțime poate fi implementată ca arbore binar de căutare (în practică, o formă echilibrată, pentru eficiență). 
Completați modulul de mai jos cu funcții pentru a căuta și adăuga un element într-o mulțime reprezentată ca arbore. 
Puteți apoi instanția module S = TreeSet(String) și folosi toate funcțiile scrise, la fel cum le-ați folosit pe cele din modulul standard Set.

module TreeSet(Elt: Set.OrderedType) = struct
  type t = Nil | T of t * Elt.t * t
  let empty = Nil
  let is_empty t = (t = Nil)
  let singleton e = T (Nil, e, Nil)
  let rec mem e s = ...
  (* folosește:   Elt.compare e1 e2   (va fi < 0, 0 sau > 0) *)
  let rec add e s = ...
end
*)

let empty=Nil;; 

let is_empty t= (t=Nil);;

let singleton e= BT(Nil,e,Nil);;

let rec mem e tree = match tree with
  |Nil->false
  |BT(l,n,r)->if (n=e) then true else if e>n then mem e r else mem e l;;
mem 5 binary;;

let rec add e tree = if (mem e tree) then failwith "already a member"
                      else match tree with
                        |Nil->BT(Nil,e,Nil)
                        |BT(l,n,r)->if (e<n) then BT(add e l,n,r) else BT(l,n,add e r);;

add 20 binary;;

(* EX. 7
Scrieți o funcție care determină dacă un arbore binar e echilibrat, 
în sensul că pentru fiecare nod, înălțimea celor doi subarbori diferă cu cel mult 1.

Indicație: Folosiți o funcție auxiliară care calculează înălțimea unui arbore (similar cu cea de la curs), 
dar generează o excepție (de exemplu Exit) în loc să returneze înălțimea dacă diferența de înălțime între subarbori depășește 1.
Funcția cerută va apela funcția auxiliară de calcul a înălțimii, 
returnând true dacă aceasta se încheie cu succes, 
sau false dacă eșuează cu excepție (vezi ca exemplu implementarea lui mem pentru liste din notițele de curs.
*)

let rec height bt = match bt with
  | Nil -> 0
  | BT(Nil,n,Nil) -> 0
  | BT(l,n,r) -> 1 + max (height l) (height r);;

height binary;;

let rec height_raise bt = match bt with
  | Nil -> raise Exit
  | BT(Nil,n,Nil) -> raise Exit
  | BT(l,n,r) -> if ( max (height l) (height r) ) - ( min (height l) (height r) ) > 1 then raise Exit else true;;

let rec avl bt = match bt with
  | Nil -> true
  | BT(Nil,n,Nil) -> true
  | BT(l,n,Nil) -> false
  | BT(Nil,n,r) -> false
  | BT(l,n,r) -> if height_raise bt = true then true else false;;

avl binary;;

(* EX. 8
Un arbore binar cu valori diferite în fiecare nod poate fi reconstruit în mod unic cunoscând lista nodurilor sale în inordine și preordine. 
Reconstruirea se poate face recursiv, observând că rădăcina (primul nod din lista în preordine) 
împarte lista în inordine în listele pentru subarborele stâng și cel drept. 
Listele corespondente în preordine pot fi identificate după lungime.
De exemplu, avănd:

inordine: [1; 7; 5; 6; 11; 2; 8; 4; 9]
preordine: [2; 7; 1; 6; 5; 11; 8; 9; 4]

rădăcina e 2, și am redus problema la cei doi subarbori: 
inordine [1; 7; 5; 6; 11] cu preordine [7; 1; 6; 5; 11] (următoarele 5 noduri), 
și inordine [8; 4; 9] cu preordine [8; 9; 4].

Scrieți o funcție care construiește arborele, fiind date cele două liste.
*)

let listain = [1;7;5;6;11;2;8;4;9] ;;
let listapre = [2;7;1;6;5;11;8;9;4] ;;

let tilx x l = 
  let rec tlx l acc=match l with
  | [] -> List.rev acc
  | h::t -> if(h=x) then List.rev acc else tlx t (h::acc)
  in tlx l [];;

let afterx x l =List.rev (tilx x (List.rev l));;

let firstn l n = 
  let rec fstn l n acc = match l with 
  | [] -> List.rev acc
  | h::t -> if(n>0) then fstn t (n-1) (h::acc) else List.rev acc
  in fstn l n [];; 

let lastn l n = List.rev (firstn (List.rev l) n);;   

let rec makeBinTree li lp = match lp with
| [] -> Nil
| h::[] -> BT(Nil,h,Nil)
| h::t -> BT((makeBinTree (tilx h li) (firstn t (List.length (tilx h li)))),h,(makeBinTree (afterx h li) (lastn t (List.length (afterx h li)))));;

makeBinTree listain listapre;;

(* EX. 9
Scrieți o funcție care returnează al n-lea nod în inordine dintr-un arbore (numărând de la zero). 
Prelucrați subarborele stâng. 
Dacă are prea puține noduri, returnați printr-o excepție (declarați exception Too_large of int) 
al câtelea nod trebuie căutat în restul arborelui, și returnați, după caz rădăcina sau rezultatul căutării în arborele drept.
*)

exception Too_large of int;;

let nth n tree=
  let rec nth2 n l=match l with
  |[]->failwith "Too large"
  |h::t->if (n=1) then h else nth2 (n-1) t
  in nth2 n (inorder_oarecare tree);;

inorder_oarecare oarecare;;
nth 3 oarecare;;

(* EX. 10
Afisate toate nodurile unui arbore binar de pe un nivel k.
*)

let level nivel bt = 
  let rec aux nivel bt lista k = match bt with
    | Nil -> lista
    | BT(l,n,r) -> if k = nivel then n::lista else aux nivel r (aux nivel l lista (k+1)) (k+1) 
  in aux nivel bt [] 0;;

level 3 binary;;

(* EX. 11
Verificati daca X se gaseste in arborele binar.
*)

let rec mem element bt = match bt with
  | Nil -> false
  | BT(left, n, right) -> n = element || mem element left || mem element right;;

mem 12 binary;;
mem 20 binary;;

(* EX. 12
Afisati maximul dintr-un arbore binar.
*)

let rec maxim bt max = match bt with
  | Nil -> if max = 0 then failwith "eroare" else max
  | BT(l,n,r) -> if n>max then maxim bt n else if l>r then maxim l max else maxim r max;;

