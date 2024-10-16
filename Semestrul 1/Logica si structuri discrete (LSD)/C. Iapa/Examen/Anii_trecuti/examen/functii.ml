(* minim/maxim (discutat la curs) 
Scrieți o funcție care returnează minimul/maximul a trei valori date ca parametri. 
Folosiți funcțiile predefinite min respectiv max care funcționează cu orice valori de același tip. 
Remarcați tipul funcției scrise și verificați că funcționează și cu întregi și cu reali (și chiar cu șiruri), însă nu cu un amestec.*)

let maxim a b c = max a (max b c);;
maxim 1 2 3;;

let minim a b c = min a (min b c);;
minim 1 2 3;;

(* ecuația de gradul 2 
Scrieți o funcție care ia ca parametri trei întregi a, b, c și 
tipărește soluțiile ecuației de gradul doi ax2+bx+c=0, sau un mesaj dacă nu există soluții reale. 
Folosiți funcția predefinită sqrt : float -> float pentru rădăcina pătrată și nu uitați conversiile de la întreg la real unde sunt necesare. 
Folosiți secvențierea când trebuie tipărite două soluții. *)

let ecuatie a b c = 
  let delta = b*b-4*a*c in
    if delta < 0 then Printf.printf "nu exista solutii reale"
      else 
        if delta = 0 then Printf.printf "%d" (-b/2*a)
         (* else Printf.printf "%d, %d" ((-b+(sqrt delta))/2*a)(-b-(sqrt delta)/2*a);;  *)

(* Scrieți o funcție cu trei parametri (de același tip oarecare), 
care returnează câte valori distincte există între argumentele primite (unul, două sau trei) și 
tipărește, după caz, un mesaj: "toate argumentele sunt distincte/egale" sau 
"argumentele 1 și 2 (resp. 2 și 3, sau 1 și 3) sunt egale". 
Evitați pe cât posibil duplicarea de cod: pentru porțiuni de cod similare, 
creați (și apelați) o funcție care conține partea comună și are ca parametri valorile care diferă. *)

let trei a b c = if ( a = b && a = c ) then Printf.printf "toate egale" 
                  else if (a = b && a <> c) then Printf.printf "1 si 2"
                        else if ( b = c && a <> b ) then Printf.printf "2 si 3"
                              else if ( a = c && a <> b ) then Printf.printf "1 si 3"
                                    else Printf.printf "toate diferite";;
                                    
trei 1 2 3;;
trei 1 2 1;;
trei 1 1 2;;
trei 1 1 1;;
trei 1 2 2;;

(*
Scrieți o funcție care calculează mediana a trei valori (valoarea aflată între celelalte două).
Încercați să scrieți cod cât mai simplu, și să nu-l repetați. 
Puteți folosi o funcție auxiliară care calculează mediana a trei numere, 
pentru care știm că primul e mai mic sau egal decât al doilea. 
Sau puteți încerca să compuneți doar funcțiile standard max/min de două elemente (expresia trebuie să fie oarecum simetrică). 
Care din variante necesită mai puține comparații?
*)

let mediana a b c = if ( min a ( min b c ) <> a && max a ( max b c ) <> a ) then a
                      else if ( min a ( min b c ) <> b && max a ( max b c ) <> b ) then b
                              else c;;

mediana 1 2 3;;
mediana 1 3 2;;
mediana 2 1 3;;

(* 
(1) Scrieti o functie care sa aib a urmatorul tip: val f : int → float → bool = <fun>.
*)

let f a b = if float_of_int (a) > b then true else false;;

f 3 4.;;

