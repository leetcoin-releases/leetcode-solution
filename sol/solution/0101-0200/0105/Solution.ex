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
defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end
defmodule Solution do
  @spec build_tree(preorder :: [integer], inorder :: [integer]) :: TreeNode.t() | nil
  def build_tree([], []), do: nil
  def build_tree([root_val | preorder_rest], inorder) do
    {left_inorder, [_root | right_inorder]} = Enum.split_while(inorder, &(&1 != root_val))
    left_count = length(left_inorder)
    {left_preorder, right_preorder} = Enum.split(preorder_rest, left_count)
    %TreeNode{
      val: root_val,
      left: build_tree(left_preorder, left_inorder),
      right: build_tree(right_preorder, right_inorder)
    }
  end
end