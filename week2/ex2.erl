-module(ex2).
-export([double/1]).

double([]) ->
    [];
double([X|Xs]) ->
    [X * 2|double(Xs)].
