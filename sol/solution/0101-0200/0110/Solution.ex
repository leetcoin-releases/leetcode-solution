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
  def is_balanced(nil), do: true
  def is_balanced(root), do: check(root) != -1
  defp check(nil), do: 0
  defp check(%TreeNode{left: left, right: right}) do
    l = check(left)
    if l == -1 do
      -1
    else
      r = check(right)
      if r == -1 or abs(l - r) > 1 do
        -1
      else
        max(l, r) + 1
      end
    end
  end
end
