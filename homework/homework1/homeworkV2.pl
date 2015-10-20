%cs3011 homework #1, Student Number: 13319368
%Prelude:

numeral(0).
numeral(X+Y):- numeral(X), numeral(Y).
numeral(X-Y):- numeral(X), numeral(Y).
numeral(s(X)):- numeral(X).
numeral(p(X)):- numeral(X).

%Exercise 1 


add2(0, 0, 0).
add2(0, Y, Z)			:- add2(Y, 0, Zs), simplify(Zs, Z).
add2(s(X), Y, s(Z)) 		:- add2(X, Y, Zs), simplify(Zs, Z).
add2(p(X), Y, p(Z))		:- add2(X, Y, Zs), simplify(Zs, Z).	
add2(X0+X1, Y, Z)		:- add2(X0, X1, Xs), add2(Y, 0, Ys), 
					add2(Xs, Ys, Zs), simplify(Zs, Z).
add2(-X, Y, Z)			:- add2(X, 0, Xs), minus(Xs, Xss), add2(Xss, Y, Zs), simplify(Zs, Z).
add2(X0-X1, Y, Z)		:- subtract(X0, X1, Xs), add2(Y, 0, Ys),
					add2(Xs, Ys, Zs), simplify(Zs, Z).
%Exercise 2 helper declarations


simplify(W, Z)						:- simplifyHelper(W, 0, 0, Z).

simplifyHelper(0, 0, 0, Z)			:- numeral(Z).
simplifyHelper(s(W), X, Y, Z)		:- simplifyHelper(W, s(X), Y, Z).
simplifyHelper(p(W), X, Y, Z)		:- simplifyHelper(W, X, p(Y), Z).
simplifyHelper(0, s(X), p(Y), Z)	:- simplifyHelper(0, X, Y, Z).
simplifyHelper(0, s(X), 0, s(Z))	:- simplifyHelper(0, X, 0, Z).
simplifyHelper(0, 0, p(Y), p(Z))	:- simplifyHelper(0, 0, Y, Z).

%Exercise 3

minus(X, Y)					:-simplify(X, Z), minusHelper(Z, Y).

minusHelper(0, Y)				:- numeral(Y).
minusHelper(s(X), p(Y))				:- minusHelper(X, Y).
minusHelper(p(X), s(Y))				:- minusHelper(X, Y).

%Exercise 5

subtract(X, Y, Z)				:- add2(X, 0, Xs), add2(Y, 0, Ys), minus(Ys, Yss),
							add2(Xs, Yss, Zs), simplify(Zs, Z).	
