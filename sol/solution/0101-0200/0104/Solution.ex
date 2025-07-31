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
  @spec max_depth(root :: TreeNode.t() | nil) :: integer
  def max_depth(nil), do: 0
  def max_depth(%TreeNode{left: left, right: right}) do
    1 + max(max_depth(left), max_depth(right))
  end
end