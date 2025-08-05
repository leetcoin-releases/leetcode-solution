%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec sorted_list_to_bst(Head :: #list_node{} | null) -> #tree_node{} | null.
sorted_list_to_bst(null) ->
    null;
sorted_list_to_bst(Head) ->
    List = to_list(Head),
    build_bst(List).
to_list(null) -> [];
to_list(#list_node{val = V, next = Next}) ->
    [V | to_list(Next)].
build_bst([]) -> null;
build_bst(List) ->
    Len = length(List),
    Mid = Len div 2,
    {Left, [Root|Right]} = lists:split(Mid, List),
    #tree_node{
        val = Root,
        left = build_bst(Left),
        right = build_bst(Right)
    }.