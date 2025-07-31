-spec length_of_longest_substring(S :: unicode:unicode_binary()) -> integer().
length_of_longest_substring(S) ->
    sliding_window(S, 0, 0, 0).
sliding_window(<<>>, Start, Pos, Max) -> 
    erase(),
    max(Max, Pos - Start);
sliding_window(<<C, S/binary>>, Start, Pos, Max) ->
    NewStart =
        case get(C) of
            Idx when is_integer(Idx), Idx >= Start -> Idx + 1;
            _ -> Start
        end,
    NewMax = max(Max, Pos - NewStart + 1),
    put(C, Pos),
    sliding_window(S, NewStart, Pos + 1, NewMax).