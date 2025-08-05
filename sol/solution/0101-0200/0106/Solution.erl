%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec build_tree(Inorder :: [integer()], Postorder :: [integer()]) -> #tree_node{} | null.
build_tree(Inorder, Postorder) ->
    InMap = maps:from_list(lists:zip(Inorder, lists:seq(0, length(Inorder) - 1))),
    PostIndex = length(Postorder) - 1,
    build_tree_helper(Inorder, Postorder, 0, length(Inorder) - 1, PostIndex, InMap).
build_tree_helper(_Inorder, _Postorder, InStart, InEnd, _PostIndex, _InMap) when InStart > InEnd ->
    null;
build_tree_helper(Inorder, Postorder, InStart, InEnd, PostIndex, InMap) ->
    RootVal = lists:nth(PostIndex + 1, Postorder),
    Root = #tree_node{val = RootVal},
    InIndex = maps:get(RootVal, InMap),
    RightSize = InEnd - InIndex,
    Right = build_tree_helper(Inorder, Postorder, InIndex + 1, InEnd, PostIndex - 1, InMap),
    Left = build_tree_helper(Inorder, Postorder, InStart, InIndex - 1, PostIndex - 1 - RightSize, InMap),
    Root#tree_node{left = Left, right = Right}.