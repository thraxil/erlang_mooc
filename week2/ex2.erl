-module(ex2).
-export([double/1, evens/1]).

double([]) ->
    [];
double([X|Xs]) ->
    [X * 2|double(Xs)].


evens([]) ->
    [];
evens([X|Xs]) when X rem 2 == 0 ->
    [X|evens(Xs)];
evens([_X|Xs]) ->
    evens(Xs).
