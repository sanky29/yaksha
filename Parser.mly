%{      
         open Printf;;
         open Exp;;             (*the first code block*)
         open String;;           (*the tokenizer for our file*)
         (*some helpful function*)
         exception Eof;;
%}
		%token <string> FNAME                            /*Variable*/
        %token <int> NUM			                     /*function or constant*/
        %token <string> VAR
        %token ADD
        %token SUB
        %token MUL
        %token DIV
        %token LOOP
        %token TO 
        %token END
        %token EQUAL
        %token OPENVC
	    %token CLOSEVC
        %token COMMENT
        %token OP
        %token CP
        %token COLLON
        %token ENDLINE                    
        %token EOF
        %start main
        %type <Exp.exp list> main

%%
	constants:
			NUM {Num $1}
		  | VAR {Var $1} 

	addition: 
		| substraction {$1}
		| addition ADD substraction {Add ($1,$3)}
		| OP addition CP {$2}

	substraction:
		| multiplication {$1}
		| substraction SUB substraction {Sub ($1,$3)}
		| substraction SUB multiplication {Sub ($1,$3)}
		| OP substraction CP {$2}

	multiplication:
		| division {$1}
		| multiplication MUL division {Mul ($1,$3)}
		| OP multiplication CP {$2}

	division:
		| constants {$1}
		| division DIV constants {Div ($1,$3)}
		| OP division CP {$2}

	s:
		| FNAME {$1}
		| VAR {$1}

	name:
		| s {Str ([$1],[])}
		| OPENVC addition CLOSEVC name {match $4 with
											| Str(a,b) -> Str(("")::a,$2::b)}
		| s OPENVC addition CLOSEVC name {match $5 with
											| Str(a,b) -> Str(($1)::a,$3::b)}
	imagelist:

		| name addition addition addition {[Image ($1,$2,$3,$4)]}
		| name addition addition addition imagelist {(Image ($1,$2,$3,$4))::$5}

	single_exp:
		| addition addition imagelist {Display ($1,$2,$3)}


	main:
		| EOF {[]}
		| COMMENT main {$2}
		| single_exp ENDLINE main  {$1::$3}
		| single_exp ENDLINE {[$1]}
		| loops {[$1]}
		| loops main {$1::$2}

	loops:
		| LOOP VAR EQUAL addition TO addition COLLON main END LOOP ENDLINE {Loop ($2,$4,$6,$8)}
%%
