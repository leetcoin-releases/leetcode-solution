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
def is_symmetric(root)
    is_mirror = ->(t1, t2) {
        return true if !t1 && !t2
        return false if !t1 || !t2
        t1.val == t2.val && is_mirror.call(t1.left, t2.right) && is_mirror.call(t1.right, t2.left)
    }
    is_mirror.call(root, root)
end
