-spec is_happy(N :: integer()) -> boolean().
square_sum(0) -> 0;
square_sum(N) ->
    D = N rem 10,
    D * D + square_sum(N div 10).
is_happy(N) -> is_happy(N, square_sum(N)).
is_happy(Slow, Fast) when Fast == 1 -> true;
is_happy(Slow, Fast) when Slow == Fast -> false;
is_happy(Slow, Fast) ->
    is_happy(square_sum(Slow), square_sum(square_sum(Fast))).