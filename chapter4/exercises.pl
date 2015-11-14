%4.3

second(X, [_, X|_]).

%4.4

swap12([X0, X1|T], [X1, X0|T]).

%4.5

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([], []).
listtran([X|T0], [Y|T1]) :- tran(X, Y), listtran(T0, T1).

%4.6

twice([], []).
twice([X|T0], [X, X|T1]) :- twice(T0, T1).
