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
  List<List<int>> levelOrderBottom(TreeNode? root) {
    List<List<int>> result = [];
    if (root == null) return result;
    List<TreeNode> queue = [root];
    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      List<int> level = [];
      for (int i = 0; i < levelSize; i++) {
        TreeNode node = queue.removeAt(0);
        level.add(node.val);
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
      result.add(level);
    }
    return result.reversed.toList();
  }
}