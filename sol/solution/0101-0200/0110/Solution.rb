# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  def check(node)
    return 0 unless node
    left = check(node.left)
    return -1 if left == -1
    right = check(node.right)
    return -1 if right == -1
    return -1 if (left - right).abs > 1
    [left, right].max + 1
  end
  check(root) != -1
end
