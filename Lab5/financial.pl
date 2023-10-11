% Financial Advisor
% code to get you started

% declare predicates and their arity
% not necessary, but avoids warnings

:- dynamic invest_in/1.
:- dynamic savings_account/1.
:- dynamic amount_saved/1.
:- dynamic dependents/1.
:- dynamic income/1.
:- dynamic minsavings/2.
:- dynamic earnings/2.


invest_in(savings) :-
	savings_account(inadequate).
	
invest_in(stocks) :-
	savings_account(adequate), income(adequate).
	
invest_in(combination) :-
	savings_account(adequate), income(inadequate).

% rules 6 & 7

income(A) :- 
	earnings(X,steady),
	dependents(Y),
	minincome(Y, MI),
	(X > MI,
    A = adequate;       % note that ; means OR
    X =< MI,
    A = inadequate).

% Add in myself
income(inadequate) :-
	earnings(X,unsteady).
	
	
% Add in myself
savings_account(A) :-
	amount_saved(X),
	dependents(Y),
	minsavings(Y, MS),
	(X > MS,
	A = adequate;
	X =< MS,
	A = inadequate).

minincome(D, I) :-
	I is 15000 + D * 4000.
	
% Add in myself
minsavings(D, I) :-
	I is 5000 * D.

getSavings :-
	write('Input savings amount '),
	read(S),
	assert(amount_saved(S)).
	
getDependents :-
	write('Input dependents '),
	read(D),
	assert(dependents(D)).
	
getEarnings :-
	write('input earnings'),
	read(E),
	write('steady or unsteady'),
	read(S),
	assert(earnings(E,S)).



%  go is to run the whole program, makes it easier
go :- getSavings, getDependents, getEarnings,
      invest_in(X),
      write('Advice is to invest in '),
	  write(X).

	  


