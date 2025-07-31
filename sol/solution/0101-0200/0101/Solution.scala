/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def isSymmetric(root: TreeNode): Boolean = {
        def isMirror(t1: TreeNode, t2: TreeNode): Boolean = {
            if (t1 == null && t2 == null) true
            else if (t1 == null || t2 == null) false
            else t1.value == t2.value && isMirror(t1.left, t2.right) && isMirror(t1.right, t2.left)
        }
        isMirror(root, root)
    }
}
