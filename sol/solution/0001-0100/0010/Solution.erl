is_match(S, P) ->
    S1 = case is_binary(S) of true -> binary_to_list(S); false -> S end,
    P1 = case is_binary(P) of true -> binary_to_list(P); false -> P end,
    M = length(S1),
    N = length(P1),
    DP1 = array:new((M+1)*(N+1), {default, false}),
    DP1_0 = array:set(0, true, DP1),
    DP2 = lists:foldl(
        fun(J, Acc) ->
            case {lists:nth(J, P1), array:get(J-2, Acc)} of
                {$*, true} -> array:set(J, true, Acc);
                _ -> Acc
            end
        end, DP1_0, lists:seq(2, N, 2)),
    DPFinal = lists:foldl(
        fun(I, AccDP) ->
            lists:foldl(
                fun(J, AccDP2) ->
                    case lists:nth(J, P1) of
                        $* ->
                            array:set(I*(N+1)+J,
                                array:get(I*(N+1)+(J-2), AccDP2) orelse
                                (array:get((I-1)*(N+1)+J, AccDP2) andalso
                                 (lists:nth(I, S1) =:= lists:nth(J-1, P1) orelse lists:nth(J-1, P1) =:= $.)),
                                AccDP2);
                        Char ->
                            array:set(I*(N+1)+J,
                                array:get((I-1)*(N+1)+(J-1), AccDP2) andalso
                                (lists:nth(I, S1) =:= Char orelse Char =:= $.),
                                AccDP2)
                    end
                end, AccDP, lists:seq(1, N))
        end, DP2, lists:seq(1, M)),
    array:get(M*(N+1)+N, DPFinal).