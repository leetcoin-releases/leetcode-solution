%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
    add_two_numbers(L1, L2, 0, #list_node{val = 0}).
add_two_numbers(null, null, 0, Dummy) ->
    Dummy#list_node.next;
add_two_numbers(L1, L2, Carry, Dummy) ->
    Sum = Carry + 
          case L1 of
              null -> 0;
              _ -> L1#list_node.val
          end +
          case L2 of
              null -> 0;
              _ -> L2#list_node.val
          end,
    NewCarry = Sum div 10,
    NewNode = #list_node{val = Sum rem 10},
    NextL1 = case L1 of
                 null -> null;
                 _ -> L1#list_node.next
             end,
    NextL2 = case L2 of
                 null -> null;
                 _ -> L2#list_node.next
             end,
    case L1 =:= null andalso L2 =:= null andalso NewCarry =:= 0 of
        true -> NewNode;
        false -> NewNode#list_node{next = add_two_numbers(NextL1, NextL2, NewCarry, #list_node{val = 0})}
    end.