%cs3011 homework #1, Student Number: 13319368
%Prelude:



add(0, X, X).
add(s(X), Y, s(Z)):- add(X, Y, Z).
add(p(X), Y, p(Z)):- add(X, Y, Z).

numeral(0).
numeral(X+Y):- numeral(X), numeral(Y).
numeral(s(X)):- numeral(X).
numeral(p(X)):- numeral(X).


%Exercise 1 & 2



add2(X0+X1, Y0+Y1, Z)	:- add(X0, X1, Xs), add(Y0, Y1, Ys), add(Xs, Ys, Zs), simplify(Zs, Z).
add2(X0+X1, Y, Z)		:- add(X0, X1, Xs), add(Xs, Y, Z).
add2(X, Y0+Y1, Z)		:- add(Y0, Y1, Ys), add(X, Ys, Z).
add2(X, Y, Z)			:- add(X, Y, Z).



simplify(W, Z)						:- simplifyHelper(W, 0, 0, Z).

simplifyHelper(0, 0, 0, Z)			:- numeral(Z).
simplifyHelper(s(W), X, Y, Z)		:- simplifyHelper(W, s(X), Y, Z).
simplifyHelper(p(W), X, Y, Z)		:- simplifyHelper(W, X, p(Y), Z).
simplifyHelper(0, s(X), p(Y), Z)	:- simplifyHelper(0, X, Y, Z).
simplifyHelper(0, s(X), 0, s(Z))	:- simplifyHelper(0, X, 0, Z).
simplifyHelper(0, 0, p(Y), p(Z))	:- simplifyHelper(0, 0, Y, Z).

%Exercise 3

