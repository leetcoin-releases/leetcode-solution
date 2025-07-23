-spec my_atoi(S :: unicode:unicode_binary()) -> integer().
my_atoi(S) ->
    Trimmed = string:trim(S),
    parse(Trimmed, 0, 1, false).
parse(<<>>, Acc, Sign, _Started) ->
    Acc * Sign;
parse(<<C, Rest/binary>>, Acc, Sign, Started) ->
    case C of
        C when C >= $0, C =< $9 ->
            Digit = C - $0,
            NewAcc = Acc * 10 + Digit,
            if
                Sign =:= 1 andalso NewAcc > 2147483647 -> 2147483647;
                Sign =:= -1 andalso -NewAcc < -2147483648 -> -2147483648;
                true -> parse(Rest, NewAcc, Sign, true)
            end;
        $- when not Started ->
            parse(Rest, Acc, -1, true);
        $+ when not Started ->
            parse(Rest, Acc, 1, true);
        _ when not Started andalso C == $\s ->
            parse(Rest, Acc, Sign, false);
        _ -> Acc * Sign
    end.