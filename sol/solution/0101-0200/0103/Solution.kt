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
    fun zigzagLevelOrder(root: TreeNode?): List<List<Int>> {
        val levelOrder = mutableListOf<MutableList<Int>>()
        getLevelOrder(root, levelOrder, 0)
        return levelOrder
    }
    fun getLevelOrder(root: TreeNode?, levelOrder: MutableList<MutableList<Int>>, height: Int) {
        if (root == null) return
        if (height == levelOrder.size) 
            levelOrder.add(mutableListOf<Int>())
        if (height % 2 == 0) 
            levelOrder[height].add(root.`val`)  
        else 
            levelOrder[height].add(0, root.`val`)        
        getLevelOrder(root.left, levelOrder, height + 1)
        getLevelOrder(root.right, levelOrder, height + 1)
    }
}