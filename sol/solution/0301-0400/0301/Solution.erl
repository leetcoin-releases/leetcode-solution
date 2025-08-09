-spec remove_invalid_parentheses(S :: unicode:unicode_binary()) -> [unicode:unicode_binary()].
remove_invalid_parentheses(S) ->
    Chars = unicode:characters_to_list(S),
    {RmL, RmR} = count_removals(Chars, 0, 0),
    AnsSet = dfs(Chars, RmL, RmR, 0, [], sets:new()),
    sets:to_list(AnsSet).
-spec count_removals([integer()], integer(), integer()) -> {integer(), integer()}.
count_removals([], L, R) -> {L, R};
count_removals([$\( | T], L, R) -> count_removals(T, L+1, R);
count_removals([$) | T], L, R) when L > 0 -> count_removals(T, L-1, R);
count_removals([$) | T], L, R) -> count_removals(T, L, R+1);
count_removals([_ | T], L, R) -> count_removals(T, L, R).
-spec dfs([integer()], integer(), integer(), integer(), [integer()], sets:set()) -> sets:set().
dfs([], RL, RR, Open, Path, Acc) ->
    case {RL, RR, Open} of
        {0,0,0} ->
            Bin = unicode:characters_to_binary(lists:reverse(Path)),
            sets:add_element(Bin, Acc);
        _ ->
            Acc
    end;
dfs([C | Rest], RL, RR, Open, Path, Acc) ->
    case C of
        $\( ->
            Acc1 = case RL > 0 of
                       true -> dfs(Rest, RL-1, RR, Open, Path, Acc);
                       false -> Acc
                   end,
            dfs(Rest, RL, RR, Open+1, [C | Path], Acc1);
        $) ->
            Acc1 = case RR > 0 of
                       true -> dfs(Rest, RL, RR-1, Open, Path, Acc);
                       false -> Acc
                   end,
            case Open > 0 of
                true -> dfs(Rest, RL, RR, Open-1, [C | Path], Acc1);
                false -> Acc1
            end;
        _Other ->
            dfs(Rest, RL, RR, Open, [C | Path], Acc)
    end.
