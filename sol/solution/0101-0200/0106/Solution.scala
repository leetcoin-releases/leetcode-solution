/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def buildTree(inorder: Array[Int], postorder: Array[Int]): TreeNode = {
        val inMap = inorder.zipWithIndex.toMap
        var postIndex = postorder.length - 1
        def buildTreeHelper(inStart: Int, inEnd: Int): TreeNode = {
            if (inStart > inEnd) return null
            val root = new TreeNode(postorder(postIndex))
            postIndex -= 1
            val inIndex = inMap(root.value)
            root.right = buildTreeHelper(inIndex + 1, inEnd)
            root.left = buildTreeHelper(inStart, inIndex - 1)
            root
        }
        buildTreeHelper(0, inorder.length - 1)
    }
}