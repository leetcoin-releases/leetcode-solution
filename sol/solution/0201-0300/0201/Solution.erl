-spec range_bitwise_and(Left :: integer(), Right :: integer()) -> integer().
range_bitwise_and(Left, Right) when Left < Right ->
    range_bitwise_and(Left, Right band (Right - 1));
range_bitwise_and(_, Right) ->
    Right.