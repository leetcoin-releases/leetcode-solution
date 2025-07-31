from typing import Optional, List

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def zigzagLevelOrder(self, root: Optional['TreeNode']) -> List[List[int]]:
        if not root:
            return []
        result = []
        queue = [root]
        left_to_right = True
        while queue:
            level = []
            next_queue = []
            for node in queue:
                level.append(node.val)
                if node.left:
                    next_queue.append(node.left)
                if node.right:
                    next_queue.append(node.right)
            if not left_to_right:
                level.reverse()
            result.append(level)
            queue = next_queue
            left_to_right = not left_to_right
        return result