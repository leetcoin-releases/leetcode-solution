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
  @spec build_tree(inorder :: [integer], postorder :: [integer]) :: TreeNode.t() | nil
  def build_tree(inorder, postorder) do
    in_map = Enum.with_index(inorder) |> Map.new(fn {v, i} -> {v, i} end)
    post_index = length(postorder) - 1
    build_tree_helper(inorder, postorder, 0, length(inorder) - 1, {post_index, in_map})
  end
  defp build_tree_helper(_inorder, _postorder, in_start, in_end, _post_index_map) when in_start > in_end, do: nil
  defp build_tree_helper(inorder, postorder, in_start, in_end, {post_index, in_map}) do
    root_val = Enum.at(postorder, post_index)
    root = %TreeNode{val: root_val}
    in_index = Map.get(in_map, root_val)
    right = build_tree_helper(inorder, postorder, in_index + 1, in_end, {post_index - 1, in_map})
    left = build_tree_helper(inorder, postorder, in_start, in_index - 1, {post_index - 1 - (in_end - in_index), in_map})
    %TreeNode{root | left: left, right: right}
  end
end