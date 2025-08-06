-spec int_to_roman(Num :: integer()) -> unicode:unicode_binary().
int_to_roman(Num) ->
    int_to_roman(Num, 
        [{1000, <<"M">>}, {900, <<"CM">>}, {500, <<"D">>}, {400, <<"CD">>},
         {100, <<"C">>}, {90, <<"XC">>}, {50, <<"L">>}, {40, <<"XL">>},
         {10, <<"X">>}, {9, <<"IX">>}, {5, <<"V">>}, {4, <<"IV">>}, {1, <<"I">>}]
    ).
int_to_roman(0, _) ->
    <<>>;
int_to_roman(Num, [{Value, Roman} | Rest]) when Num >= Value ->
    <<Roman/binary, (int_to_roman(Num - Value, [{Value, Roman} | Rest]))/binary>>;
int_to_roman(Num, [_ | Rest]) ->
    int_to_roman(Num, Rest).