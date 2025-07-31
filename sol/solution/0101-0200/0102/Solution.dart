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
  List<List<int>> res = [];
  List<List<int>> levelOrder(TreeNode? root) {
    dfs(root, 0);
    return res;
  }
  dfs(TreeNode? node, int level){
    if (node == null) return;
    if (res.length <= level) res.add([]);
    res[level].add(node.val);
    dfs(node.left, level+1);
    dfs(node.right, level+1);
  }
}