%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec sorted_array_to_bst(Nums :: [integer()]) -> #tree_node{} | null.
sorted_array_to_bst(Nums) ->
    build_bst(Nums, 1, length(Nums)).
build_bst(_Nums, Left, Right) when Left > Right ->
    null;
build_bst(Nums, Left, Right) ->
    Mid = Left + (Right - Left) div 2,
    #tree_node{
        val = lists:nth(Mid, Nums),
        left = build_bst(Nums, Left, Mid - 1),
        right = build_bst(Nums, Mid + 1, Right)
    }.