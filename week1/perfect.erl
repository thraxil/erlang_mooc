-module(perfect).
-export([perfect/1]).

perfectT(N, D, Acc) when D > (N div 2) ->
    Acc == N;
perfectT(N, D, Acc) when N rem D == 0 ->
    perfectT(N, D+1, Acc + D);
perfectT(N, D, Acc) ->
    perfectT(N, D+1, Acc).

perfect(N) ->
    perfectT(N, 1, 0).
