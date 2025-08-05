/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def sortedArrayToBST(nums: Array[Int]): TreeNode = {
        def buildBST(left: Int, right: Int): TreeNode = {
            if (left > right) null
            else {
                val mid = left + (right - left) / 2
                val root = new TreeNode(nums(mid))
                root.left = buildBST(left, mid - 1)
                root.right = buildBST(mid + 1, right)
                root
            }
        }
        buildBST(0, nums.length - 1)
    }
}