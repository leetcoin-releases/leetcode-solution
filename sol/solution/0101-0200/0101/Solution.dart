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
  bool isSymmetric(TreeNode? root) {
    bool isMirror(TreeNode? t1, TreeNode? t2) {
      if (t1 == null && t2 == null) return true; if (t1 == null || t2 == null) return false;
      return t1.val == t2.val && isMirror(t1.left, t2.right) && isMirror(t1.right, t2.left);
    }
    return isMirror(root, root);
  }
}
