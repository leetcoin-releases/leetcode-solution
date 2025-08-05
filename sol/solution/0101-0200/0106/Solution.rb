# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  @in_map = {}
  inorder.each_with_index { |val, i| @in_map[val] = i }
  @post_index = postorder.length - 1
  build_tree_helper(inorder, postorder, 0, inorder.length - 1)
end
def build_tree_helper(inorder, postorder, in_start, in_end)
  return nil if in_start > in_end
  root = TreeNode.new(postorder[@post_index])
  @post_index -= 1
  in_index = @in_map[root.val]
  root.right = build_tree_helper(inorder, postorder, in_index + 1, in_end)
  root.left = build_tree_helper(inorder, postorder, in_start, in_index - 1)
  root
end