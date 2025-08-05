/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    TreeNode? buildBST(int left, int right) {
      if (left > right) return null;
      int mid = left + (right - left) ~/ 2;
      TreeNode root = TreeNode(nums[mid]);
      root.left = buildBST(left, mid - 1);
      root.right = buildBST(mid + 1, right);
      return root;
    }
    return buildBST(0, nums.length - 1);
  }
}