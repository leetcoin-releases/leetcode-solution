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
  def level_order(nil), do: []
  def level_order(root) do
    level_order([root], [])
  end
  defp level_order([], acc), do: Enum.reverse(acc)
  defp level_order(nodes, acc) do
    values = Enum.map(nodes, & &1.val)
    next =
      nodes
      |> Enum.flat_map(fn node -> [node.left, node.right] end)
      |> Enum.filter(& &1)
    level_order(next, [values | acc])
  end
end
