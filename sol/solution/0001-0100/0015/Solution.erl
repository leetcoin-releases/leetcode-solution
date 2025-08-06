-spec three_sum([integer()]) -> [[integer()]].
three_sum(Nums) ->
    Sorted = lists:sort(Nums),
    Tuple = list_to_tuple(Sorted),
    Len = tuple_size(Tuple),
    three_sum_loop(Tuple, 1, Len, []).
three_sum_loop(_T, I, Len, Acc) when I > Len - 2 ->
    lists:reverse(Acc);
three_sum_loop(T, I, Len, Acc) ->
    A = element(I, T),
    case (I > 1) andalso (A =:= element(I - 1, T)) of
        true ->
            three_sum_loop(T, I + 1, Len, Acc);
        false ->
            Acc1 = two_sum(T, I, I + 1, Len, A, Acc),
            three_sum_loop(T, I + 1, Len, Acc1)
    end.
two_sum(_T, _I, Left, Right, _A, Acc) when Left >= Right ->
    Acc;
two_sum(T, I, Left, Right, A, Acc) ->
    B = element(Left, T),
    C = element(Right, T),
    Sum = A + B + C,
    case Sum of
        0 ->
            Triplet = [A, B, C],
            NewAcc = [Triplet | Acc],
            NewLeft = skip_forward(T, B, Left + 1, Right),
            NewRight = skip_backward(T, C, NewLeft, Right - 1),
            two_sum(T, I, NewLeft, NewRight, A, NewAcc);
        _ when Sum < 0 ->
            two_sum(T, I, Left + 1, Right, A, Acc);
        _ ->
            two_sum(T, I, Left, Right - 1, A, Acc)
    end.
skip_forward(T, Val, Pos, Right) when Pos =< Right, element(Pos, T) =:= Val ->
    skip_forward(T, Val, Pos + 1, Right);
skip_forward(_T, _Val, Pos, _Right) ->
    Pos.
skip_backward(T, Val, Left, Pos) when Pos >= Left, element(Pos, T) =:= Val ->
    skip_backward(T, Val, Left, Pos - 1);
skip_backward(_T, _Val, _Left, Pos) ->
    Pos.