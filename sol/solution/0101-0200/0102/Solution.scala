import scala.collection.mutable

/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def levelOrder(root: TreeNode): List[List[Int]] = {
        if (root == null) return List()
        val result = mutable.ListBuffer[List[Int]]()
        val queue = mutable.Queue[TreeNode]()
        queue.enqueue(root)
        while (queue.nonEmpty) {
            val sz = queue.size
            val level = mutable.ListBuffer[Int]()
            for (_ <- 0 until sz) {
                val node = queue.dequeue()
                level += node.value
                if (node.left != null) queue.enqueue(node.left)
                if (node.right != null) queue.enqueue(node.right)
            }
            result += level.toList
        }
        result.toList
    }
}
