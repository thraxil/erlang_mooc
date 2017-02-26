-module(perimeter).
-include_lib("eunit/include/eunit.hrl").
-export([perimeter/1]).


%% shape is tuple of {type, ... parameters ... }
%% supported types:
%%  circle - with a radius
%%  rectangle - with width/height
%%  triangle - with the three sides defined
%% anything else returns "Unknown Shape"
perimeter({circle, Radius}) ->
    2 * math:pi() * Radius;
perimeter({rectangle, Width, Height}) ->
    (2 * Width) + (2 * Height);
perimeter({triangle, A, B, C}) ->
    A + B + C;
perimeter(_) ->
    "Unknown Shape".

%% basic unit tests
perimeter_test() ->
    TwoPi = math:pi() * 2,
    TwoPi = perimeter({circle, 1}),
    22 = perimeter({rectangle, 5, 6}),
    0 = perimeter({rectangle, 0, 0}),
    10 = perimeter({triangle, 6, 3, 1}),
    "Unknown Shape" = perimeter(anything_else).
    
