/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    fun sortedArrayToBST(nums: IntArray): TreeNode? {
        fun buildBST(left: Int, right: Int): TreeNode? {
            if (left > right) return null
            val mid = left + (right - left) / 2
            val root = TreeNode(nums[mid])
            root.left = buildBST(left, mid - 1)
            root.right = buildBST(mid + 1, right)
            return root
        }
        return buildBST(0, nums.size - 1)
    }
}