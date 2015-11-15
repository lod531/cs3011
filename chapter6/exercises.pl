%Prelude

append([], Acc, Acc).
append([H|T0], Y, [H|T1]):- append(T0, Y, T1).

reverse(X, Y):- reverseHelper(X, Y, []).
reverseHelper([], Acc, Acc).
reverseHelper([H|T0], Y, Acc):- NewAcc = [H|Acc], reverseHelper(T0, Y, NewAcc).

sameList([], []).
sameList([X|T0], [X|T1]):- sameList(T0, T1).

%6.1

doubled([], []).
doubled([X0|T0], [X0, X0|T1]):- doubled(T0, T1).

%6.2

palindrome(X):- reverse(X, Y), sameList(X, Y).

%6.3

topTail([_, X1|T], R):- topTailHelper([X1|T], R).

topTailHelper([_|[]], []).
topTailHelper([X0|T], [X0|R]):- topTailHelper(T, R).

%6.4

last([Y], Y).
last([_|T0], Y):- last(T0, Y).

lastViaRev(X, Y):- reverse(X, [Y|_]).

%6.5

swapFl([HeadOfFirstList|T0], [HeadOfSecondList|T1]):- swapFlHelper(T0, T1, HeadOfFirstList, HeadOfSecondList).

swapFlHelper([HeadOfSecondList|[]], [HeadOfFirstList|[]], HeadOfFirstList, HeadOfSecondList).
swapFlHelper([X0|T0], [X0|T1], HeadOfFirstList, HeadOfSecondList):- 
					swapFlHelper(T0, T1, HeadOfFirstList, HeadOfSecondList).
