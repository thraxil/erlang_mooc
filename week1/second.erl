-module(second).
-export([hypotenuse/2, triangle_perimeter/2]).

hypotenuse(A,B) ->
    math:sqrt(first:square(A) + first:square(B)).

triangle_perimeter(A,B) ->
    A + B + hypotenuse(A,B).
