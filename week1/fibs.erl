-module(fibs).
-export([fib/1, fibTD/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

% fib(4)
%  -> fib(4 - 1) + fib(4 - 2).
%  -> fib(3) + fib(2).
%  -> (fib(3 - 1) + fib(3 - 2)) + fib(2).
%  -> (fib(2) + fib(1)        ) + fib(2).
%  -> ((fib(2 - 1) + fib(2 - 2)) + fib(1)) + fib(2).
%  -> ((fib(1) + fib(0)       )) + fib(1)  + fib(2).
%  -> ((1 + fib(0)       )) + fib(1)  + fib(2).
%  -> ((1 + 0       )) + fib(1)  + fib(2).
%  -> 1 + fib(1)  + fib(2).
%  -> (1 + 1)  + fib(2).
%  -> (2)  + fib(2).
%  -> (2)  + (fib(2 - 1) + fib(2 - 2)).
%  -> (2)  + (fib(1)     + fib(0)).
%  -> (2)  + (1          + fib(0)).
%  -> (2)  + (1          + 0).
%  -> (2)  + (1).
%  -> 3.

fibT(0, _, Acc2) -> Acc2;
fibT(1, Acc1, _) -> Acc1;
fibT(N, Acc1, Acc2) ->
    fibT(N - 1, Acc1 + Acc2, Acc1).

fibTD(N) ->
    fibT(N, 1, 0).

% fibTD(4)
% -> fibT(4, 1, 0)
% -> fibT(4 - 1, 1 + 0, 1)
% -> fibT(3, 1, 1)
% -> fibT(3 - 1, 1 + 1, 1)
% -> fibT(2, 2, 1)
% -> fibT(2 - 1, 2 + 1, 2)
% -> fibT(1, 3, 2)
% -> 3
