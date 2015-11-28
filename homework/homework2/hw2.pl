%-----------------------------------------------------Q1
%generates a u2v language, where the u and v are strings
%over the alphabet {0, 1}, 2 is itself, and the number
%of 0's in u equals that of the number of 1's in v.
%eg "1 0 0 1 1 2 1 0 0 0 1 0 0 0" is correct.

q1		--> u2vMiddle.

u2vMiddle 	--> u2vLeft, u2vTwo, u2vRight, u2vTail.

u2vLeft		--> [0].
u2vLeft		--> u2vOne, u2vLeft.

u2vTwo		--> [2].
u2vTwo		--> u2vOne, u2vTwo.

u2vRight	--> [1].
u2vRight	--> u2vZero, u2vRight.

u2vTail		--> [].
u2vTail		--> u2vZero, u2vTail.

u2vZero		--> [0].

u2vOne		--> [1].


%-----------------------------------------------------Q2
%generates a language of of 9 elements, where the first
%element is a colour, the second is a nationality, and
%the third is a pet species. The fourth and seventh
%elements are also a colour, but each are unique with 
%respect to each other. Same for nationalities, same
%for pet species. Essentially 3 3-tuples of 
%(colour, nationality, pet species).

q2				--> colour(_, _, _).

colour(A, B, C) 		--> colourInstance(A, A1),
					nationalityInstance(B, B1),
					petInstance(C, C1),
					colour(A1, B1, C1). 
colour(_, _, _)			--> [].

colourInstance(red, notRed) 	--> [red].
colourInstance(blue, notBlue) 	--> [blue].
colourInstance(green, notGreen) --> [green].


colourInstance(notRed, notRedNotBlue)	--> [blue].
colourInstance(notRed, notRedNotGreen)	--> [green].

colourInstance(notRedNotBlue, exhausted)--> [green].
colourInstance(notRedNotGreen, exhausted) --> [blue].


colourInstance(notBlue, notRedNotBlue)	--> [red].
colourInstance(notBlue, notBlueNotGreen) --> [green].

colourInstance(notBlueNotGreen, exhausted)--> [red].


colourInstance(notGreen, notRedNotGreen) --> [red].
colourInstance(notGreen, notBlueNotGreen) --> [blue].



nationalityInstance(english, notEnglish)	--> [english].
nationalityInstance(spanish, notSpanish)	--> [spanish].
nationalityInstance(japanese, notJapanese)	--> [japanese].

nationalityInstance(notEnglish, notEnglishNotSpanish)	--> [spanish].
nationalityInstance(notEnglish, notEnglishNotJapanese)	--> [japanese].

nationalityInstance(notEnglishNotSpanish, exhausted)	--> [japanese].
nationalityInstance(notEnglishNotJapanese, exhausted)	--> [spanish].

nationalityInstance(notSpanish, notEnglishNotSpanish)	--> [english].
nationalityInstance(notSpanish, notSpanishNotJapanese)	--> [japanese].

nationalityInstance(notSpanishNotJapanese, exhausted)	--> [english].

nationalityInstance(notJapanese, notEnglishNotJapanese) --> [english].
nationalityInstance(notJapanese, notEnglishNotSpanish) 	--> [spanish].



petInstance(jaguar, notJaguar)		--> [jaguar].
petInstance(snail, notSnail)		--> [snail].
petInstance(zebra, notZebra)		--> [zebra].

petInstance(notJaguar, notJaguarNotSnail)	--> [snail].
petInstance(notJaguar, notJaguarNotZebra)	--> [zebra].

petInstance(notJaguarNotSnail, exhausted)	--> [zebra].
petInstance(notJaguarNotZebra, exhausted)	--> [snail].

petInstance(notSnail, notJaguarNotSnail)	--> [jaguar].
petInstance(notSnail, notJaguarNotZebra)	--> [zebra].

petInstance(notSnailNotZebra, exhausted)	--> [jaguar].

petInstance(notZebra, notJaguarNotZebra)	--> [zebra].
petInstance(notZebra, notSnailnotZebra)		--> [snail].
