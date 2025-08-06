-spec roman_to_int(S :: unicode:unicode_binary()) -> integer().
roman_to_int(S) ->
    RomanMap = #{$I => 1, $V => 5, $X => 10, $L => 50, $C => 100, $D => 500, $M => 1000},
    List = unicode:characters_to_list(S),
    roman_to_int(List, RomanMap, 0).
roman_to_int([], _RomanMap, Acc) ->
    Acc;
roman_to_int([H], RomanMap, Acc) ->
    maps:get(H, RomanMap) + Acc;
roman_to_int([H1, H2 | T], RomanMap, Acc) ->
    V1 = maps:get(H1, RomanMap),
    V2 = maps:get(H2, RomanMap),
    if
        V1 < V2 ->
            roman_to_int([H2 | T], RomanMap, Acc - V1);
        true ->
            roman_to_int([H2 | T], RomanMap, Acc + V1)
    end.