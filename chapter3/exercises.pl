%3.2

firstInsideSecond(olga, katarina).
firstInsideSecond(natasha, olga).
firstInsideSecond(irina, natasha).

isFirstInsideSecond(X, Y):-firstInsideSecond(X, Y).
isFirstInsideSecond(X,Y):-firstInsideSecond(X, Z), isFirstInsideSecond(Z, Y).

%3.3

directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

travelFromTo(X, Y):-directTrain(X, Y).
travelFromTo(X, Y):-directTrain(X, Z), travelFromTo(Z, Y).

%3.4

numeral(0). 
numeral(succ(X))  :-  numeral(X).

greaterThan(succ(_), 0).

greaterThan(succ(X), succ(Y)):-greaterThan(X, Y).
