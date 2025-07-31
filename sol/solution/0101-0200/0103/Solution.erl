%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).
-spec zigzag_level_order(Root :: #tree_node{} | null) -> [[integer()]].
zigzag_level_order(null) -> [];
zigzag_level_order(Root) ->
  zigzag([[Root]], [], 0).
zigzag([], Acc, _) -> lists:reverse(Acc);
zigzag([[]|Rest], Acc, Dir) -> zigzag(Rest, Acc, Dir);
zigzag(Level, Acc, Dir) ->
  {Vals, NextLevel} = lists:foldl(fun(Node, {Vs, Ns}) ->
    case Node of
      null -> {Vs, Ns};
      #tree_node{val = V, left = L, right = R} ->
        {[V|Vs], Ns ++ [L, R]}
    end
  end, {[], []}, hd(Level)),
  CleanNext = [N || N <- NextLevel, N =/= null],
  ZigzagVals = case Dir rem 2 of
    0 -> lists:reverse(Vals);
    1 -> Vals
  end,
  zigzag([CleanNext | tl(Level)], [ZigzagVals|Acc], Dir+1).