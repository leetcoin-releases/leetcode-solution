-spec reverse(X :: integer()) -> integer().
reverse(X) ->
    reverse(X, 0).
reverse(0, Acc) ->
    if Acc < -2147483648; Acc > 2147483647 -> 0;
       true -> Acc
    end;
reverse(X, Acc) ->
    Pop = X rem 10,
    NewX = X div 10,
    NewAcc = Acc * 10 + Pop,
    if NewAcc < -2147483648; NewAcc > 2147483647 -> 0;
       true -> reverse(NewX, NewAcc)
    end.
