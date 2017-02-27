-module(bits).
-export([bits/1, bitsT/1]).


%% plain recursive version
bits(0) ->
    0;
bits(N) ->
    (N rem 2) + bits(N div 2).


%% tail recursive version
bitsT(0, Acc) ->
    Acc;
bitsT(N, Acc) ->
    bitsT(N div 2, Acc + (N rem 2)).

bitsT(N) ->
    bitsT(N, 0).
