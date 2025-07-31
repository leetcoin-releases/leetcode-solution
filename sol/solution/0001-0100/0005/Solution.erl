-spec longest_palindrome(S :: unicode:unicode_binary()) -> unicode:unicode_binary().
longest_palindrome(S) ->
    Chars = unicode:characters_to_list(S),
    case Chars of
        [] -> <<>>;
        [C] -> unicode:characters_to_binary([C]);
        _ ->
            Transformed = ['^' | lists:append(['#'], lists:flatmap(fun(C) -> [C, '#'] end, Chars)) ++ ['$']],
            {Center, MaxLen} = manacher(Transformed),
            Start = (Center - MaxLen + 1) div 2,
            Length = MaxLen,
            unicode:characters_to_binary(lists:sublist(Chars, Start, Length))
    end.
manacher(Chars) ->
    Len = length(Chars),
    P = array:new(Len, {default, 0}), % Array for palindrome lengths
    manacher_helper(Chars, P, 1, 0, 0, {0, 0}).
manacher_helper(Chars, P, I, C, R, {MaxC, MaxL}) when I >= length(Chars) ->
    {MaxC, MaxL};
manacher_helper(Chars, P, I, C, R, {MaxC, MaxL}) ->
    P_I = if
        I =< R ->
            Mirror = 2 * C - I,
            erlang:min(R - I, array:get(Mirror, P));
        true -> 0
    end,
    {NewP_I, NewP} = expand_palindrome(Chars, P, I, P_I),
    {NewC, NewR} = if
        I + NewP_I > R -> {I, I + NewP_I};
        true -> {C, R}
    end,
    NewMax = if
        NewP_I > MaxL -> {I, NewP_I};
        true -> {MaxC, MaxL}
    end,
    manacher_helper(Chars, NewP, I + 1, NewC, NewR, NewMax).
expand_palindrome(Chars, P, I, P_I) ->
    Left = I - P_I - 1,
    Right = I + P_I + 1,
    case Left >= 1 andalso Right =< length(Chars) andalso lists:nth(Left, Chars) =:= lists:nth(Right, Chars) of
        true -> expand_palindrome(Chars, P, I, P_I + 1);
        false -> {P_I, array:set(I, P_I, P)}
    end.