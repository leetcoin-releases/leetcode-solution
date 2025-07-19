-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    find_target_sum(Nums, Target, 0, #{}).
find_target_sum([Num | NextNums], Target, Index, Map) ->
    NumInMap = maps:is_key(Num, Map),
    if 
        NumInMap ->
            [maps:get(Num, Map), Index];
        true ->
            find_target_sum(NextNums, Target, Index+1, maps:put(Target-Num, Index, Map))
    end.