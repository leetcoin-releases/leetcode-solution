# Definition for a binary tree node.
#
defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end
defmodule Solution do
  @spec sorted_array_to_bst(nums :: [integer]) :: TreeNode.t | nil
  def sorted_array_to_bst(nums) do
    build_bst(nums, 0, length(nums) - 1)
  end
  defp build_bst(_nums, left, right) when left > right, do: nil
  defp build_bst(nums, left, right) do
    mid = left + div(right - left, 2)
    %TreeNode{
      val: Enum.at(nums, mid),
      left: build_bst(nums, left, mid - 1),
      right: build_bst(nums, mid + 1, right)
    }
  end
end