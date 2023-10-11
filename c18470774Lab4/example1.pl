
isa(bear, mammal).
isa(whale, mammal).
isa(cat, mammal).
isa(mammal, animal).
isa(fish, animal).

has(mammal, vertebra).
has(cat, fur).
has(bear, fur).

lives_in(fish, water).
lives_in(whale, water).

iz(X,Y) :- isa(X,Y).
iz(X,Y) :- has(X,Y).
iz(X,Y) :- lives_in(X,Y).
iz(X,Z) :- isa(X,Y), iz(Y,Z).



isInstance(X,Z) :- instance(X,Y), iz(Y,Z).

instance(tom,cat).
instance(bear1, bear).
instance(fish1,fish).






