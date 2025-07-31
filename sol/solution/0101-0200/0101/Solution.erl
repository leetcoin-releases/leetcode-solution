%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_symmetric(Root :: #tree_node{} | null) -> boolean().
is_symmetric(Root) ->
    is_mirror(Root, Root).
is_mirror(null, null) -> true;
is_mirror(null, _) -> false;
is_mirror(_, null) -> false;
is_mirror(#tree_node{val = Val1, left = L1, right = R1}, #tree_node{val = Val2, left = L2, right = R2}) ->
    Val1 =:= Val2 andalso is_mirror(L1, R2) andalso is_mirror(R1, L2);
is_mirror(_, _) -> false.