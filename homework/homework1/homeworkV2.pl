%cs3011 homework #1, Student Number: 13319368
%Prelude:

numeral(0).
numeral(X+Y):- numeral(X), numeral(Y).
numeral(X-Y):- numeral(X), numeral(Y).
numeral(s(X)):- numeral(X).
numeral(p(X)):- numeral(X).

add(0, s(Y), Z)			:- add(Y, Y, Ys), simplify(Zs, Z).
add(s(X), Y, s(Z))		:- add(X, Y, Z).
add(p(X), Y, p(Z))		:- add(X, Y, Z).

%Exercise 1 



add2(0, Y, Z)			:- add2(Y, 0, Zs), simplify(Zs, Z).
add2()
%Exercise 2 helper declarations


simplify(W, Z)						:- simplifyHelper(W, 0, 0, Z).

simplifyHelper(0, 0, 0, Z)			:- numeral(Z).
simplifyHelper(s(W), X, Y, Z)		:- simplifyHelper(W, s(X), Y, Z).
simplifyHelper(p(W), X, Y, Z)		:- simplifyHelper(W, X, p(Y), Z).
simplifyHelper(0, s(X), p(Y), Z)	:- simplifyHelper(0, X, Y, Z).
simplifyHelper(0, s(X), 0, s(Z))	:- simplifyHelper(0, X, 0, Z).
simplifyHelper(0, 0, p(Y), p(Z))	:- simplifyHelper(0, 0, Y, Z).

%Exercise 3

minus(X, Y)							:-simplify(X, Z), minusHelper(Z, Y).

minusHelper(0, Y)					:- numeral(Y).
minusHelper(s(X), p(Y))				:- minusHelper(X, Y).
minusHelper(p(X), s(Y))				:- minusHelper(X, Y).