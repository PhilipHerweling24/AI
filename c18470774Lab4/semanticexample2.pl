
isa(tom, cat).
isa(cat, mammal).
isa(mammal, animal).
isa(bird, animal).

caught(tom, bird).

is_owned_by(tom, john).

is_coloured(tom, ginger).

like(cat, cream).

sat_on(cat, mat).

has(mammal, fur).

iz(X,Y) :- isa(X,Y).                  
iz(X,Z) :- isa(X,Y), iz(Y,Z).
iz(Y,E) :- has(Y,E).


isInstance(X,Z) :- instance(X,Y), iz(Y,Z).

instance(tom, cat).