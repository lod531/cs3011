%1

listMin([X|T], Y):- accMin(T, X, Y).
accMin([], Acc, Acc).
accMin([X|T], Acc, CurrentMin):- X < Acc, accMin(T, X, CurrentMin).
accMin([X|T], Acc, CurrentMin):- X >= Acc, accMin(T, Acc, CurrentMin).

%2

scalarMult(_, [], []).
scalarMult(X, [X0|T0], [X1|T1]):- X1 is X0*X, scalarMult(X, T0, T1).

%3

dotProduct(X, Y, Z):- dotProductHelper(X, Y, Z, 0).

dotProductHelper([], [], Acc, Acc).
dotProductHelper([X|T0], [Y|T1], Z, Acc):- NewAcc is X*Y + Acc, dotProductHelper(T0, T1, Z, NewAcc).
