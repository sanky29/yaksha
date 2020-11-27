{	(*the first block of code*)
open Parser;;
exception Eof;;
}

(*define upper ans lower string*)
let fname = ['a'-'z''A'-'Z''0'-'9' '_' '-' '/' '$' '#' '.' '%']+
let var = ['a'-'z''A'-'Z']+
let num = ['0'-'9']+
let comm = ['a'-'z''A'-'Z''0'-'9' '_' '-' '/' '$' '#' ' ' '%']*

rule tokens = parse
	
	| '{'	 {OPENVC}
	| '}'    {CLOSEVC}
	| 'l''o''o''p' {LOOP}
	| 'e''n''d'    {END}
	| 't''o'       {TO}
	| '('		   {OP}
	| ')'          {CP}
	| '+'		   {ADD}
	| '-'		   {SUB}
	| '*'          {MUL}
	| '/'		   {DIV}
	| ':'		   {COLLON}
	| ';'		   {ENDLINE}
	| '='          {EQUAL}
	| num as a {NUM (int_of_string (a))}
	| var as s {VAR s}
	| fname as s {FNAME s}
	| '/''/' comm {COMMENT}
	| ['\t' ' '] {tokens lexbuf}
	| ['\n' '\r'] {tokens lexbuf}
	| eof {EOF}
