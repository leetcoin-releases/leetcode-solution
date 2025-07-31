/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    private var index = 0
    private lateinit var inorderMap: Map<Int, Int>
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        inorderMap = inorder.withIndex().associate { it.value to it.index }
        return helper(preorder, 0, inorder.size - 1)
    }
    private fun helper(preorder: IntArray, left: Int, right: Int): TreeNode? {
        if (left > right) return null
        val rootVal = preorder[index++]
        val root = TreeNode(rootVal)
        root.left = helper(preorder, left, inorderMap[rootVal]!! - 1)
        root.right = helper(preorder, inorderMap[rootVal]!! + 1, right)
        return root
    }
}
