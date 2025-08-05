# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> Optional[TreeNode]:
        idx = {v: i for i, v in enumerate(inorder)}
        def build(l, r):
            if l > r: return None
            root = TreeNode(postorder.pop())
            i = idx[root.val]
            root.right = build(i + 1, r)
            root.left = build(l, i - 1)
            return root
        return build(0, len(inorder) - 1)