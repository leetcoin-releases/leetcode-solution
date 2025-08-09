-export([num_matrix_init_/1, num_matrix_sum_region/4]).
-spec num_matrix_init_(Matrix :: [[integer()]]) -> any().
num_matrix_init_(Matrix) ->
    M = length(Matrix),
    N = length(hd(Matrix)),
    MTuple = list_to_tuple([list_to_tuple(Row) || Row <- Matrix]),
    Prefix0 = list_to_tuple([list_to_tuple(lists:duplicate(N+1, 0)) || _ <- lists:seq(1, M+1)]),
    PrefixFilled =
        lists:foldl(
          fun(I, Acc1) ->
              lists:foldl(
                fun(J, Acc2) ->
                    Val = element(J+1, element(I+1, MTuple)),
                    NewVal = element(J+2, element(I+1, Acc2))   % top
                        + element(J+1, element(I+2, Acc2))   % left
                        - element(J+1, element(I+1, Acc2))   % top-left
                        + Val,
                    set_in_tuple_2d(Acc2, I+2, J+2, NewVal)
                end,
                Acc1,
                lists:seq(0, N-1)
            )
            end,
            Prefix0,
            lists:seq(0, M-1)
        ),
    put(prefix, PrefixFilled),
    ok.
-spec num_matrix_sum_region(Row1 :: integer(), Col1 :: integer(), Row2 :: integer(), Col2 :: integer()) -> integer().
num_matrix_sum_region(Row1, Col1, Row2, Col2) ->
    P = get(prefix),
    A = element(Col2+2, element(Row2+2, P)),
    B = element(Col2+2, element(Row1+1, P)),
    C = element(Col1+1, element(Row2+2, P)),
    D = element(Col1+1, element(Row1+1, P)),
    A - B - C + D.
set_in_tuple_2d(Table, R, C, Value) ->
    Row = element(R, Table),
    NewRow = setelement(C, Row, Value),
    setelement(R, Table, NewRow).
    %% Your functions will be called as such:
%% Your functions will be called as such:
%% num_matrix_init_(Matrix),
%% Param_1 = num_matrix_sum_region(Row1, Col1, Row2, Col2),
%% num_matrix_init_ will be called before every test case, in which you can do some necessary initializations.