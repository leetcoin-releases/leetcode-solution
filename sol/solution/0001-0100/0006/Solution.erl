-spec convert(S :: unicode:unicode_binary(), NumRows :: integer()) -> unicode:unicode_binary().
convert(S, NumRows) when NumRows =< 1; NumRows >= byte_size(S) ->
    S;
convert(S, NumRows) ->
    Rows = lists:duplicate(NumRows, []),
    convert(S, NumRows, 1, 1, Rows).

convert(<<>>, _NumRows, _CurRow, _Dir, Rows) ->
    unicode:characters_to_binary(lists:flatten(lists:map(fun lists:reverse/1, Rows)));
convert(<<C/utf8, Rest/binary>>, NumRows, CurRow, Dir, Rows) ->
    NewRows = add_char(Rows, CurRow, C),
    NewDir = case {CurRow, Dir} of
        {1, -1} -> 1;
        {NumRows, 1} -> -1;
        _ -> Dir
    end,
    NewCurRow = CurRow + NewDir,
    convert(Rest, NumRows, NewCurRow, NewDir, NewRows).

add_char(Rows, CurRow, C) ->
    {NewRows, _} = lists:mapfoldl(
        fun(Row, Idx) ->
            if Idx =:= CurRow -> {[C | Row], Idx + 1};
               true -> {Row, Idx + 1}
            end
        end, 1, Rows),
    NewRows.