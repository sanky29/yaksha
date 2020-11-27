open Lexer;;
open Parser;;
open List;;
open Lexing;;
open Exp;;
open Printf;;

exception VariableUndefined of string
exception ValueError of string

let rec lookup l s = 
	match l with
	| [] -> raise (VariableUndefined ("Variable "^s^" Not defined"))
	| (a,b)::t -> if (a=s) then b else lookup t s;;

(*eval math expresssions*)
let rec evalm e t =
	match e with
	| Num n -> n
	| Var s -> (lookup t s)
	| Add (e1,e2) -> (evalm e1 t)+(evalm e2 t)
	| Sub (e1,e2) -> (evalm e1 t)-(evalm e2 t)
	| Mul (e1,e2) -> (evalm e1 t)*(evalm e2 t)
	| Div (e1,e2) -> (evalm e1 t)/(evalm e2 t);;

(*list to string*)
let rec ltos l s =
	match l with
	[] -> s
	| h::t -> ltos t (s^h);; 

(*str to string*)
let rec str_to_string s l1 l2 g=
	match l1,l2 with
	| a,[] -> s^(ltos a "")
	| (h1::t1),(h2::t2) -> str_to_string (s^h1^(string_of_int (evalm h2 g))) t1 t2 g
	| _ -> raise (ValueError "error in conversion");;


(*image list to string*)
let rec evalimagelist l t=
	match l with
	| [] -> ""
	| (Image (Str (l1,l2) ,e1,e2,e3))::tl -> let i1 = evalm e1 t in
										     let i2 = evalm e2 t in
										     let i3 = evalm e3 t in
										     if (i1 < 0 || i2 < 0 || i3 < 0) then raise (ValueError "values should be positive")
										     else let s = str_to_string "" l1 l2 t in
										     s^" "^(string_of_int i1)^" "^(string_of_int i2)^" "^(string_of_int i3)^" "^(evalimagelist tl t);;

(*check exp*)
let rec compile e t s =
	match e with
	| [] -> s
	| (Display (e1,e2,il))::tl ->  let i1 = evalm e1 t in
							       let i2 = evalm e2 t in
							       if (i1 < 0 || i2 < 0 || i1 > i2) then raise (ValueError "values should be positive")
							       else let temp = (string_of_int i1)^" "^(string_of_int i2)^" "^(evalimagelist il t) in
							            compile tl t (s@[temp])
	| (Loop (v,es,en,cl))::tl -> let temp = ref s in
						         let is = evalm es t in
						         let ie = evalm en t in
						         if (is < 0 || ie < 0 || is > ie) then raise (ValueError "wrong frame numbers")
						         else 
						         	for i = is to ie do
						   		   		let si = compile cl ((v,i)::t) [] in
						   		   		temp := (!temp)@si;
						         	done;
						         	compile tl t (!temp);;


let file_in = open_in Sys.argv.(1);;
let input = Lexing.from_channel file_in;;
let x =Parser.main Lexer.tokens input;;
let y = compile x [] [];;


let oc = open_out ((Sys.argv.(1))^".stack");;

let rec string_list l s =
	match  l with
	| [] -> s
	| h::t -> string_list (t) (s^"\n"^h);;
let ans = (string_list y "");;
fprintf oc "%s\n" ans;;