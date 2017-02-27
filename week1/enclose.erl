-module(enclose).
-export([enclose/1]).

angleX(A, B, C) ->
    math:acos(((C * C) - (A * A) - (B * B)) / (2 * A * B)).

vertical(B, X) ->
    B * math:sin(X).

enclose({circle, R}) ->
    {rectangle, 2 * R, 2 * R};
enclose({rectangle, L, W}) ->
    {rectangle, L, W};
%% ----------------------
%% triangles are tricky. Geometry is not my strong
%% point, so there might be a much simpler way to do
%% this, but...
%%
%%         3
%%     B  /|\  C
%%       / | \
%%      X--|--2
%%         A
%% with angle X and sides A, B, we can figure out the vertical
%% first, via law of cosines, angle X:
%%      C^2 = A^2 + B^2 - 2*A*B*cos(X)
%%      2*A*B*cos(X) = C^2 - A^2 - B^2
%%      cos(X) = (C^2 - A^2 - B^2)/2*A*B
%%      X = acos((C^2 - A^2 - B^2)/2*A*B)
%% then the vertical is just
%%      sin(X) = Vertical/B
%%      Vertical = B * sin(X)
%%
%% when A is the longest side
enclose({triangle, A, B, C}) when A >= B andalso A >= C ->
    X = angleX(A, B, C),
    V = vertical(B, X),
    {rectangle, A, V};
%% when B is the longest side
enclose({triangle, A, B, C}) when B >= A  andalso B >= C ->
    X = angleX(B, A, C),
    V = vertical(A, X),
    {rectangle, B, V};
%% finally, C must be the longest
enclose({triangle, A, B, C}) ->
    X = angleX(C, A, B),
    V = vertical(C, X),
    {rectangle, C, V}.
