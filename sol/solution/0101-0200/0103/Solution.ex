# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end
defmodule Solution do
  @spec zigzag_level_order(root :: TreeNode.t | nil) :: [[integer]]
  def zigzag_level_order(nil), do: []
  def zigzag_level_order(root) do
    zigzag_level_order_bfs([root], 0, [])
  end
  defp zigzag_level_order_bfs([], _level, acc), do: Enum.reverse(acc)
  defp zigzag_level_order_bfs(nodes, level, acc) do
    {vals, next_level} =
      Enum.reduce(nodes, {[], []}, fn
        nil, acc -> acc
        node, {vals, next_level} ->
          {vals ++ [node.val], next_level ++ [node.left, node.right]}
      end)
    vals =
      if rem(level, 2) == 1 do
        Enum.reverse(vals)
      else
        vals
      end
    if vals == [] do
      Enum.reverse(acc)
    else
      zigzag_level_order_bfs(Enum.filter(next_level, & &1), level + 1, [vals | acc])
    end
  end
end