ocamlc Exp.ml
ocamlyacc Parser.mly
ocamlc -c Parser.mli
ocamlc -c Parser.ml
ocamllex Lexer.mll
ocamlc -c Lexer.ml
ocamlc Exp.cmo Parser.cmo Lexer.cmo -o a.exe main.ml
rm Exp.c*
rm Parser.c*
rm Lexer.c*
rm a.out
rm main.c*
rm Parser.mli
