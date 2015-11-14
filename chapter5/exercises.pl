%5.1

increment(X, Y):- X+1 =:= Y.

%5.2

sum(X, Y, Z):- Z =:= X+Y.

%5.3

addOne([], []).

addOne([X|T0], [Y|T1]):- Y is X + 1, addOne(T0, T1).
