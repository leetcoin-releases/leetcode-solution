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
  bool isBalanced(TreeNode? root) {
    int check(TreeNode? node) {
      if (node == null) return 0;
      int left = check(node.left);
      if (left == -1) return -1;
      int right = check(node.right);
      if (right == -1) return -1;
      if ((left - right).abs() > 1) return -1;
      return 1 + (left > right ? left : right);
    }
    return check(root) != -1;
  }
}