numeral(0).
numeral(s(X)):- numeral(X).
numeral(X+Y):- numeral(X), numeral(Y).

add(0, X, X).
add(s(X), Y, s(Z)):- add(X, Y, Z).

%Exercise 1
