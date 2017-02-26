-module(pieces).
-export([pieces/1]).

pieces(0) -> 1;
pieces(N) -> N + pieces(N - 1).
