-module(lists_exercise).
-export([product/1, maximum/1, productT/1, maximumT/1]).


% direct recursion

product([])     -> 1;
product([X|Xs]) -> X * product(Xs).

maximum([X])    -> X;
maximum([X|Xs]) -> max(X, maximum(Xs)).

% tail recursion

productT(Xs)          -> productT(Xs, 1).

productT([], Acc)     -> Acc;
productT([X|Xs], Acc) -> productT(Xs, X * Acc).

maximumT([X|Xs]) ->
    maximumT([X|Xs], X).

maximumT([X], Max) -> max(X, Max);
maximumT([X|Xs], Max) -> maximumT(Xs, max(X, Max)).
