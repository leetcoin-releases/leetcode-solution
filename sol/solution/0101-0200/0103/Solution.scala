/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def zigzagLevelOrder(root: TreeNode): List[List[Int]] = {
        if (root == null) return List()
        import scala.collection.mutable.Queue
        val result = scala.collection.mutable.ListBuffer[List[Int]]()
        val queue = Queue[TreeNode]()
        queue.enqueue(root)
        var leftToRight = true
        while (queue.nonEmpty) {
            val size = queue.size
            val level = new Array[Int](size)
            for (i <- 0 until size) {
                val node = queue.dequeue()
                val idx = if (leftToRight) i else size - 1 - i
                level(idx) = node.value
                if (node.left != null) queue.enqueue(node.left)
                if (node.right != null) queue.enqueue(node.right)
            }
            result += level.toList
            leftToRight = !leftToRight
        }
        result.toList
    }
}