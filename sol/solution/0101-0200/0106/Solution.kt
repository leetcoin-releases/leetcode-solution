/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    private var postIndex: Int = 0
    private val inMap = mutableMapOf<Int, Int>()    
    fun buildTree(inorder: IntArray, postorder: IntArray): TreeNode? {
        inorder.forEachIndexed { i, v -> inMap[v] = i }
        postIndex = postorder.size - 1
        return buildTreeHelper(inorder, postorder, 0, inorder.size - 1)
    }
    private fun buildTreeHelper(inorder: IntArray, postorder: IntArray, inStart: Int, inEnd: Int): TreeNode? {
        if (inStart > inEnd) return null
        val root = TreeNode(postorder[postIndex--])
        val inIndex = inMap[root.`val`]!!
        root.right = buildTreeHelper(inorder, postorder, inIndex + 1, inEnd)
        root.left = buildTreeHelper(inorder, postorder, inStart, inIndex - 1)
        return root
    }
}