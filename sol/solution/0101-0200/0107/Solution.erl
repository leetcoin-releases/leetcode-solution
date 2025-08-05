%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec level_order_bottom(Root :: #tree_node{} | null) -> [[integer()]].
level_order_bottom(null) ->
    [];
level_order_bottom(Root) ->
    Levels = level_order(Root),
    lists:reverse(Levels).
level_order(Root) ->
    Queue = queue:new(),
    Queue1 = queue:in({Root, 0}, Queue),
    process_queue(Queue1, []).
process_queue(Queue, Acc) ->
    case queue:out(Queue) of
        {{value, {Node, Level}}, NewQueue} ->
            #tree_node{val = Val, left = Left, right = Right} = Node,
            Queue1 = case Left of
                         null -> NewQueue;
                         _ -> queue:in({Left, Level + 1}, NewQueue)
                     end,
            Queue2 = case Right of
                         null -> Queue1;
                         _ -> queue:in({Right, Level + 1}, Queue1)
                     end,
            NewAcc = update_acc(Acc, Level, Val),
            process_queue(Queue2, NewAcc);
        {empty, _} ->
            lists:map(fun({_, Vals}) -> Vals end, lists:sort(Acc))
    end.
update_acc(Acc, Level, Val) ->
    case lists:keyfind(Level, 1, Acc) of
        {Level, Vals} ->
            lists:keyreplace(Level, 1, Acc, {Level, Vals ++ [Val]});
        false ->
            Acc ++ [{Level, [Val]}]
    end.