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
  List<List<int>> result = [];
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    dfs(root, 0);
    return result;
  }
  dfs(TreeNode? node, int level){
    if (node == null) return;
    if (result.length <= level) result.add([]);
    if (level % 2 == 0){
      result[level].add(node.val);
    }else {
      result[level].insert(0, node.val);
    }
    dfs(node.left, level+1);
    dfs(node.right, level+1);

  }
}