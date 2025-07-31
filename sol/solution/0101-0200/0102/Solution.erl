%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
level_order(Root) ->
    level_order_queue([Root], []).
level_order_queue([], Acc) ->
    lists:reverse(Acc);
level_order_queue(Q, Acc) ->
    Levels = [N || N <- Q, N =/= null],
    case Levels of
        [] -> lists:reverse(Acc);
        _ ->
            LevelVals = [N#tree_node.val || N <- Levels],
            Next = lists:foldl(fun(N, S) ->
                        lists:append(S, [N#tree_node.left, N#tree_node.right])
                    end, [], Levels),
            level_order_queue(Next, [LevelVals|Acc])
    end.
