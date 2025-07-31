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
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    if (preorder.isEmpty || inorder.isEmpty) return null;
    Map<int, int> inorderIndex = {};
    for (int i = 0; i < inorder.length; i++) {
      inorderIndex[inorder[i]] = i;
    }
    TreeNode? helper(int preStart, int inStart, int inEnd) {
      if (preStart >= preorder.length || inStart > inEnd) return null;
      int rootVal = preorder[preStart];
      TreeNode root = TreeNode(rootVal);
      int idx = inorderIndex[rootVal]!;
      int leftSize = idx - inStart;
      root.left = helper(preStart + 1, inStart, idx - 1);
      root.right = helper(preStart + leftSize + 1, idx + 1, inEnd);
      return root;
    }
    return helper(0, 0, inorder.length - 1);
  }
}