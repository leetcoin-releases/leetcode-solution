/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def isBalanced(root: TreeNode): Boolean = {
        def check(node: TreeNode): Int = {
            if (node == null) 0
            else {
                val left = check(node.left)
                if (left == -1) return -1
                val right = check(node.right)
                if (right == -1) return -1
                if (Math.abs(left - right) > 1) -1 else Math.max(left, right) + 1
            }
        }
        check(root) != -1
    }
}
