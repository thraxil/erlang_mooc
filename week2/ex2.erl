-module(ex2).
-export([double/1, evens/1, median/1]).

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


median(Xs) ->
    Sorted = lists:sort(Xs),
    median(Sorted, lists:reverse(Sorted)).

%% same element at the head of each
%% must be at the middle
median([X|_Forward], [X|_Reverse]) -> X;
%% tails are the same
%% they must be []
%% so we are at the middle of an even list
median([X|_Forward], [Y|_Forward]) -> (X+Y) / 2;
%% remove outer elements and keep going
median([_|Forward], [_|Reverse])   -> median(Forward, Reverse).
