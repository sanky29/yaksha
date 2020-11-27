type token =
  | FNAME of (string)
  | NUM of (int)
  | VAR of (string)
  | ADD
  | SUB
  | MUL
  | DIV
  | LOOP
  | TO
  | END
  | EQUAL
  | OPENVC
  | CLOSEVC
  | COMMENT
  | OP
  | CP
  | COLLON
  | ENDLINE
  | EOF

open Parsing;;
let _ = parse_error;;
# 1 "Parser.mly"
      
         open Printf;;
         open Exp;;             (*the first code block*)
         open String;;           (*the tokenizer for our file*)
         (*some helpful function*)
         exception Eof;;
# 32 "Parser.ml"
let yytransl_const = [|
  260 (* ADD *);
  261 (* SUB *);
  262 (* MUL *);
  263 (* DIV *);
  264 (* LOOP *);
  265 (* TO *);
  266 (* END *);
  267 (* EQUAL *);
  268 (* OPENVC *);
  269 (* CLOSEVC *);
  270 (* COMMENT *);
  271 (* OP *);
  272 (* CP *);
  273 (* COLLON *);
  274 (* ENDLINE *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* FNAME *);
  258 (* NUM *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\003\000\003\000\003\000\004\000\004\000\004\000\
\004\000\005\000\005\000\005\000\006\000\006\000\006\000\007\000\
\007\000\008\000\008\000\008\000\009\000\009\000\010\000\001\000\
\001\000\001\000\001\000\001\000\001\000\011\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\003\000\003\000\001\000\003\000\003\000\
\003\000\001\000\003\000\003\000\001\000\003\000\003\000\001\000\
\001\000\001\000\004\000\005\000\004\000\005\000\003\000\001\000\
\002\000\003\000\002\000\001\000\002\000\011\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\002\000\000\000\000\000\000\000\024\000\
\031\000\013\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\025\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\029\000\000\000\005\000\009\000\
\012\000\015\000\000\000\000\000\016\000\017\000\000\000\000\000\
\000\000\023\000\000\000\000\000\000\000\000\000\014\000\026\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\019\000\000\000\000\000\000\000\020\000\
\022\000\000\000\000\000\000\000\030\000"

let yydgoto = "\002\000\
\009\000\010\000\011\000\012\000\013\000\014\000\040\000\041\000\
\042\000\015\000\016\000"

let yysindex = "\016\000\
\001\000\000\000\000\000\000\000\017\255\001\000\004\255\000\000\
\000\000\000\000\011\255\060\255\079\255\064\255\068\255\001\000\
\089\255\000\000\005\255\040\255\083\255\009\255\029\255\151\255\
\029\255\032\255\065\255\001\000\000\000\004\255\000\000\000\000\
\000\000\000\000\029\255\060\255\000\000\000\000\004\255\091\255\
\004\255\000\000\060\255\079\255\032\255\064\255\000\000\000\000\
\014\255\040\255\033\255\004\255\011\255\009\255\004\255\165\255\
\103\255\011\255\047\255\000\000\165\255\151\255\001\000\000\000\
\000\000\094\255\114\255\107\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\147\255\093\255\057\255\000\000\002\000\
\000\000\000\000\000\000\097\255\078\255\113\255\000\000\000\000\
\000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\111\255\000\000\000\000\000\000\039\255\
\000\000\000\000\129\255\093\255\000\000\075\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\116\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\250\255\094\000\253\255\005\000\004\000\254\255\000\000\248\255\
\073\000\000\000\000\000"

let yytablesize = 272
let yytable = "\018\000\
\008\000\028\000\027\000\019\000\022\000\003\000\004\000\024\000\
\023\000\029\000\021\000\020\000\003\000\004\000\023\000\027\000\
\001\000\023\000\007\000\017\000\031\000\048\000\055\000\046\000\
\034\000\007\000\049\000\036\000\044\000\043\000\003\000\004\000\
\022\000\003\000\004\000\051\000\023\000\053\000\021\000\050\000\
\018\000\018\000\054\000\035\000\025\000\056\000\045\000\060\000\
\057\000\058\000\023\000\059\000\064\000\018\000\062\000\032\000\
\066\000\010\000\010\000\010\000\010\000\010\000\010\000\063\000\
\025\000\010\000\003\000\004\000\010\000\010\000\027\000\010\000\
\010\000\010\000\010\000\011\000\011\000\011\000\011\000\011\000\
\011\000\006\000\006\000\011\000\026\000\028\000\011\000\011\000\
\026\000\011\000\011\000\011\000\011\000\006\000\006\000\006\000\
\006\000\006\000\033\000\030\000\003\000\006\000\052\000\067\000\
\006\000\006\000\023\000\006\000\006\000\006\000\006\000\004\000\
\004\000\004\000\004\000\061\000\010\000\010\000\010\000\004\000\
\047\000\068\000\004\000\004\000\069\000\004\000\004\000\004\000\
\004\000\007\000\007\000\007\000\007\000\021\000\065\000\000\000\
\000\000\007\000\000\000\000\000\007\000\007\000\000\000\007\000\
\007\000\007\000\007\000\003\000\003\000\003\000\003\000\037\000\
\000\000\038\000\023\000\003\000\000\000\000\000\003\000\003\000\
\000\000\003\000\039\000\003\000\003\000\037\000\000\000\038\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\039\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\004\000\000\000\000\000\000\000\000\000\
\005\000\000\000\000\000\028\000\027\000\000\000\006\000\007\000"

let yycheck = "\006\000\
\000\000\000\000\000\000\007\000\007\000\002\001\003\001\011\000\
\004\001\016\000\007\000\007\000\002\001\003\001\004\001\007\001\
\001\000\004\001\015\001\003\001\016\001\028\000\009\001\026\000\
\016\001\015\001\030\000\023\000\025\000\025\000\002\001\003\001\
\035\000\002\001\003\001\039\000\004\001\041\000\035\000\035\000\
\002\001\003\001\045\000\015\001\005\001\013\001\015\001\056\000\
\052\000\053\000\004\001\055\000\061\000\015\001\058\000\016\001\
\063\000\001\001\002\001\003\001\004\001\005\001\006\001\017\001\
\005\001\009\001\002\001\003\001\012\001\013\001\007\001\015\001\
\016\001\017\001\018\001\001\001\002\001\003\001\004\001\005\001\
\006\001\004\001\005\001\009\001\006\001\018\001\012\001\013\001\
\006\001\015\001\016\001\017\001\018\001\001\001\002\001\003\001\
\004\001\005\001\016\001\011\001\004\001\009\001\012\001\010\001\
\012\001\013\001\004\001\015\001\016\001\017\001\018\001\001\001\
\002\001\003\001\004\001\013\001\004\001\005\001\006\001\009\001\
\027\000\008\001\012\001\013\001\018\001\015\001\016\001\017\001\
\018\001\001\001\002\001\003\001\004\001\018\001\062\000\255\255\
\255\255\009\001\255\255\255\255\012\001\013\001\255\255\015\001\
\016\001\017\001\018\001\001\001\002\001\003\001\004\001\001\001\
\255\255\003\001\004\001\009\001\255\255\255\255\012\001\013\001\
\255\255\015\001\012\001\017\001\018\001\001\001\255\255\003\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\012\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\002\001\003\001\255\255\255\255\255\255\255\255\
\008\001\255\255\255\255\010\001\010\001\255\255\014\001\015\001"

let yynames_const = "\
  ADD\000\
  SUB\000\
  MUL\000\
  DIV\000\
  LOOP\000\
  TO\000\
  END\000\
  EQUAL\000\
  OPENVC\000\
  CLOSEVC\000\
  COMMENT\000\
  OP\000\
  CP\000\
  COLLON\000\
  ENDLINE\000\
  EOF\000\
  "

let yynames_block = "\
  FNAME\000\
  NUM\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 32 "Parser.mly"
       (Num _1)
# 216 "Parser.ml"
               : 'constants))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 33 "Parser.mly"
          (Var _1)
# 223 "Parser.ml"
               : 'constants))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'substraction) in
    Obj.repr(
# 36 "Parser.mly"
                 (_1)
# 230 "Parser.ml"
               : 'addition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'substraction) in
    Obj.repr(
# 37 "Parser.mly"
                              (Add (_1,_3))
# 238 "Parser.ml"
               : 'addition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'addition) in
    Obj.repr(
# 38 "Parser.mly"
                   (_2)
# 245 "Parser.ml"
               : 'addition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'multiplication) in
    Obj.repr(
# 41 "Parser.mly"
                   (_1)
# 252 "Parser.ml"
               : 'substraction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'substraction) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'substraction) in
    Obj.repr(
# 42 "Parser.mly"
                                  (Sub (_1,_3))
# 260 "Parser.ml"
               : 'substraction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'substraction) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'multiplication) in
    Obj.repr(
# 43 "Parser.mly"
                                    (Sub (_1,_3))
# 268 "Parser.ml"
               : 'substraction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'substraction) in
    Obj.repr(
# 44 "Parser.mly"
                       (_2)
# 275 "Parser.ml"
               : 'substraction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'division) in
    Obj.repr(
# 47 "Parser.mly"
             (_1)
# 282 "Parser.ml"
               : 'multiplication))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'multiplication) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'division) in
    Obj.repr(
# 48 "Parser.mly"
                                (Mul (_1,_3))
# 290 "Parser.ml"
               : 'multiplication))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'multiplication) in
    Obj.repr(
# 49 "Parser.mly"
                         (_2)
# 297 "Parser.ml"
               : 'multiplication))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'constants) in
    Obj.repr(
# 52 "Parser.mly"
              (_1)
# 304 "Parser.ml"
               : 'division))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'division) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'constants) in
    Obj.repr(
# 53 "Parser.mly"
                           (Div (_1,_3))
# 312 "Parser.ml"
               : 'division))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'division) in
    Obj.repr(
# 54 "Parser.mly"
                   (_2)
# 319 "Parser.ml"
               : 'division))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "Parser.mly"
          (_1)
# 326 "Parser.ml"
               : 's))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "Parser.mly"
        (_1)
# 333 "Parser.ml"
               : 's))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 's) in
    Obj.repr(
# 61 "Parser.mly"
      (Str ([_1],[]))
# 340 "Parser.ml"
               : 'name))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 62 "Parser.mly"
                                 (match _4 with
											| Str(a,b) -> Str(("")::a,_2::b))
# 349 "Parser.ml"
               : 'name))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 's) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 64 "Parser.mly"
                                   (match _5 with
											| Str(a,b) -> Str((_1)::a,_3::b))
# 359 "Parser.ml"
               : 'name))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'addition) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'addition) in
    Obj.repr(
# 68 "Parser.mly"
                                    ([Image (_1,_2,_3,_4)])
# 369 "Parser.ml"
               : 'imagelist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'addition) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'addition) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'imagelist) in
    Obj.repr(
# 69 "Parser.mly"
                                              ((Image (_1,_2,_3,_4))::_5)
# 380 "Parser.ml"
               : 'imagelist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'addition) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'addition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'imagelist) in
    Obj.repr(
# 72 "Parser.mly"
                                (Display (_1,_2,_3))
# 389 "Parser.ml"
               : 'single_exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "Parser.mly"
        ([])
# 395 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Exp.exp list) in
    Obj.repr(
# 77 "Parser.mly"
                 (_2)
# 402 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'single_exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Exp.exp list) in
    Obj.repr(
# 78 "Parser.mly"
                             (_1::_3)
# 410 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'single_exp) in
    Obj.repr(
# 79 "Parser.mly"
                       ([_1])
# 417 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'loops) in
    Obj.repr(
# 80 "Parser.mly"
          ([_1])
# 424 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'loops) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Exp.exp list) in
    Obj.repr(
# 81 "Parser.mly"
               (_1::_2)
# 432 "Parser.ml"
               : Exp.exp list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 9 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 7 : 'addition) in
    let _6 = (Parsing.peek_val __caml_parser_env 5 : 'addition) in
    let _8 = (Parsing.peek_val __caml_parser_env 3 : Exp.exp list) in
    Obj.repr(
# 84 "Parser.mly"
                                                                     (Loop (_2,_4,_6,_8))
# 442 "Parser.ml"
               : 'loops))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Exp.exp list)
;;
