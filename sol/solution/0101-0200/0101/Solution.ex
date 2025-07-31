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
  def is_symmetric(root), do: is_mirror(root, root)
  defp is_mirror(nil, nil), do: true
  defp is_mirror(nil, _), do: false
  defp is_mirror(_, nil), do: false
  defp is_mirror(%TreeNode{val: v1, left: l1, right: r1}, %TreeNode{val: v2, left: l2, right: r2}) do
    v1 == v2 && is_mirror(l1, r2) && is_mirror(r1, l2)
  end
end
