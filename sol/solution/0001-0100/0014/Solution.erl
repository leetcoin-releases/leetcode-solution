-spec longest_common_prefix(Strs :: [unicode:unicode_binary()]) -> unicode:unicode_binary().
longest_common_prefix([]) -> <<>>;
longest_common_prefix([Prefix | Rest]) ->
    longest_common_prefix(Rest, Prefix).
longest_common_prefix([], Prefix) -> Prefix;
longest_common_prefix([H | T], Prefix) ->
    longest_common_prefix(T, common_prefix(Prefix, H)).
common_prefix(A, B) ->
    common_prefix(A, B, <<>>).
common_prefix(<<>>, _, Acc) -> Acc;
common_prefix(_, <<>>, Acc) -> Acc;
common_prefix(<<H1:8, T1/binary>>, <<H2:8, T2/binary>>, Acc) when H1 =:= H2 ->
    common_prefix(T1, T2, <<Acc/binary, H1>>);
common_prefix(_, _, Acc) -> Acc.