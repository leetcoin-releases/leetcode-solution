/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
  def buildTree(preorder: Array[Int], inorder: Array[Int]): TreeNode = {
    if (preorder.isEmpty || inorder.isEmpty) return null
    val inMap = inorder.zipWithIndex.toMap
    def helper(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int): TreeNode = {
      if (preStart > preEnd || inStart > inEnd) return null
      val rootVal = preorder(preStart)
      val root = new TreeNode(rootVal)
      val inRootIdx = inMap(rootVal)
      val leftSize = inRootIdx - inStart
      root.left = helper(preStart + 1, preStart + leftSize, inStart, inRootIdx - 1)
      root.right = helper(preStart + leftSize + 1, preEnd, inRootIdx + 1, inEnd)
      root
    }
    helper(0, preorder.length - 1, 0, inorder.length - 1)
  }
}