(*math expressions*)
type mexp = 
		| Num of int
		| Var of string
		| Add of (mexp*mexp)
		| Div of (mexp*mexp)
		| Sub of (mexp*mexp)
		| Mul of (mexp*mexp)

(*str type*)
type str = Str of ((string list)*(mexp list))

(*image as*)
type image = 
		| Image of (str*mexp*mexp*mexp) 

(*display type*)
type exp = 
		| Display of (mexp*mexp*(image list))
		| Loop of (string*mexp*mexp*(exp list))