/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def levelOrderBottom(root: TreeNode): List[List[Int]] = {
        var result = List[List[Int]]()
        if (root == null) return result
        var queue = scala.collection.mutable.Queue[TreeNode](root)
        while (queue.nonEmpty) {
            val levelSize = queue.length
            var level = List[Int]()
            for (_ <- 0 until levelSize) {
                val node = queue.dequeue()
                level = level :+ node.value
                if (node.left != null) queue.enqueue(node.left)
                if (node.right != null) queue.enqueue(node.right)
            }
            result = level :: result
        } 
        result
    }
}