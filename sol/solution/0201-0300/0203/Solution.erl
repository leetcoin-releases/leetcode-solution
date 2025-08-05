%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec remove_elements(Head :: #list_node{} | null, Val :: integer()) -> #list_node{} | null.
remove_elements(null, _) ->
    null;
remove_elements(#list_node{val = Val, next = Next}, Val) ->
    remove_elements(Next, Val);
remove_elements(#list_node{val = H, next = T}, Val) ->
    #list_node{val = H, next = remove_elements(T, Val)}.