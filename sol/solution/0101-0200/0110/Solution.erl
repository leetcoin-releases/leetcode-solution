%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec is_balanced(Root :: #tree_node{} | null) -> boolean().
is_balanced(null) -> true;
is_balanced(Root) -> check(Root) =/= -1.
check(null) -> 0;
check(#tree_node{left = Left, right = Right}) ->
    L = check(Left),
    case L of
        -1 -> -1;
        _ ->
            R = check(Right),
            case R of
                -1 -> -1;
                _ -> if abs(L - R) > 1 -> -1; true -> max(L, R) + 1 end
            end
    end.