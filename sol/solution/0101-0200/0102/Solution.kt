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
    fun levelOrder(root: TreeNode?): List<List<Int>> {
        val res = mutableListOf<List<Int>>()
        if (root == null) return res
        val queue: ArrayDeque<TreeNode> = ArrayDeque()
        queue.add(root)
        while (queue.isNotEmpty()) {
            val sz = queue.size
            val level = mutableListOf<Int>()
            repeat(sz) {
                val node = queue.removeFirst()
                level.add(node.`val`)
                node.left?.let { queue.add(it) }
                node.right?.let { queue.add(it) }
            }
            res.add(level)
        }
        return res
    }
}
