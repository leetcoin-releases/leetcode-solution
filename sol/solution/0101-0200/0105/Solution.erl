%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-export([build_tree/2]).
-spec build_tree(Preorder :: [integer()], Inorder :: [integer()]) -> #tree_node{} | null.
build_tree([], _) -> null;
build_tree(_, []) -> null;
build_tree([Root|PreRest], Inorder) ->
    {LeftIn, [_|RightIn]} = lists:splitwith(fun(X) -> X =/= Root end, Inorder),
    LeftLen = length(LeftIn),
    {LeftPre, RightPre} = lists:split(LeftLen, PreRest),
    #tree_node{
        val = Root,
        left = build_tree(LeftPre, LeftIn),
        right = build_tree(RightPre, RightIn)
    }.