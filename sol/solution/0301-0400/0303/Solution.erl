-export([num_array_init_/1, num_array_sum_range/2]).
%% Store prefix sums in the process dictionary for fast queries.
-spec num_array_init_(Nums :: [integer()]) -> any().
num_array_init_(Nums) ->
    PrefixSums = lists:foldl(
        fun(N, Acc) -> Acc ++ [lists:last(Acc) + N] end,
        [0],
        Nums
    ),
    %% PrefixSums: [0, Nums[0], Nums[0]+Nums[1], ...]
    put(prefix_sums, PrefixSums).
-spec num_array_sum_range(Left :: integer(), Right :: integer()) -> integer().
num_array_sum_range(Left, Right) ->
    case get(prefix_sums) of
        undefined ->
            error({no_prefix_sums});
        PrefixSums ->
            case (Left >= 0) andalso (Right >= Left) andalso (Right < length(PrefixSums) - 1) of
                true ->
                    lists:nth(Right + 2, PrefixSums) - lists:nth(Left + 1, PrefixSums);
                false ->
                    error({invalid_indices, Left, Right})
            end
    end.
%% Your functions will be called as such:
%% num_array_init_(Nums),
%% Param_1 = num_array_sum_range(Left, Right),
%% num_array_init_ will be called before every test case, in which you can do some necessary initializations.