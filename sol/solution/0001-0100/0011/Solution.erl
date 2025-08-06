-spec max_area(Height :: [integer()]) -> integer().
max_area(Height) ->
    Tuple = list_to_tuple(Height),
    max_area(Tuple, 0, tuple_size(Tuple) - 1, 0).
max_area(Tuple, Left, Right, MaxWater) when Left < Right ->
    Width = Right - Left,
    LeftHeight = element(Left + 1, Tuple),
    RightHeight = element(Right + 1, Tuple),
    Area = min(LeftHeight, RightHeight) * Width,
    NewMaxWater = max(MaxWater, Area),
    if
        LeftHeight < RightHeight ->
            max_area(Tuple, Left + 1, Right, NewMaxWater);
        true ->
            max_area(Tuple, Left, Right - 1, NewMaxWater)
    end;
max_area(_Tuple, _Left, _Right, MaxWater) ->
    MaxWater.