# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, preorder, inorder):
        self.idx = 0
        in_map = {val: i for i, val in enumerate(inorder)}
        def helper(left, right):
            if left > right:
                return None
            root_val = preorder[self.idx]
            self.idx += 1
            root = TreeNode(root_val)
            root.left = helper(left, in_map[root_val] - 1)
            root.right = helper(in_map[root_val] + 1, right)
            return root
        return helper(0, len(inorder) - 1)
