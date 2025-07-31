# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  @index = 0
  @map = {}
  inorder.each_with_index { |val, i| @map[val] = i }
  def helper(preorder, left, right)
    return nil if left > right
    val = preorder[@index]
    @index += 1
    node = TreeNode.new(val)
    node.left = helper(preorder, left, @map[val] - 1)
    node.right = helper(preorder, @map[val] + 1, right)
    node
  end
  helper(preorder, 0, inorder.length - 1)
end
