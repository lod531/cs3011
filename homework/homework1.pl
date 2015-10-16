%cs3011 homework #1, Student Number: 13319368
%Prelude:



add(0, X, X).
add(s(X), Y, s(Z)):- add(X, Y, Z).
add(p(X), Y, p(Z)):- add(X, Y, Z).

numeral(0).
numeral(X+Y):- numeral(X), numeral(Y).
numeral(X-Y):- numeral(X), numeral(Y).
numeral(s(X)):- numeral(X).
numeral(p(X)):- numeral(X).


%Exercise 1 & 2 & 4 & 5 & 6



add2(-X, Y, Z)				:- minus(X, Xn), add2(Xn, Y, Z).
add2(X, -Y, Z)				:- minus(Y, Yn), add2(X, Yn, Z).
add2(X, Y, Z)				:- add(X, Y, Zs), simplify(Zs, Z).
add2(X0+X1, Y0+Y1, Z)		:- add(X0, X1, Xs), add(Y0, Y1, Ys), add(Xs, Ys, Zs), 
								simplify(Zs, Z).
add2(X0+X1, Y, Z)			:- add(X0, X1, Xs), add(Xs, Y, Zs), simplify(Zs, Z).
add2(X, Y0+Y1, Z)			:- add(Y0, Y1, Ys), add(X, Ys, Zs), simplify(Zs, Z).
add2(-(X0-X1), -(Y0-Y1), Z) :- minus(X0, X0n), minus(Y0, Y0n), add2(X0n, X1, Xs), 
								add2(Y0n, Y1, Ys), add2(Xs, Ys, Zs), simplify(Zs, Z).
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

%Exercise 5


mySubtract(X, Y, Z)						:- minus(Y, Yn), add2(X, Yn, Z).
mySubtract(-X, Y, Z)					:- minus(X, Xn), minus(Y, Yn), add2(Xn, Yn, Z).
mySubtract(X, -Y, Z)					:- add2(X, Y, Z).
mySubtract(X0-X1, Y0-Y1, Z)				:- mySubtract(X0, X1, Xn), mySubtract(Y0, Y1, Yn), 
											mySubtract(Xn, Yn, Z).
mySubtract(X0-X1, Y, Z)					:- mySubtract(X0, X1, Xn), mySubtract(Xn, Y, Z).
mySubtract(X, Y0-Y1, Z)					:- mySubtract(Y0, Y1, Yn), mySubtract(X, Yn, Z).

