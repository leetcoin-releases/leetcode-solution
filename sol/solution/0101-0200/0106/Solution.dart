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
  int postIndex = 0;
  Map<int, int> inMap = {};
  TreeNode? buildTree(List<int> inorder, List<int> postorder) {
    for (int i = 0; i < inorder.length; i++) {
      inMap[inorder[i]] = i;
    }
    postIndex = postorder.length - 1;
    return buildTreeHelper(inorder, postorder, 0, inorder.length - 1);
  }
  TreeNode? buildTreeHelper(List<int> inorder, List<int> postorder, int inStart, int inEnd) {
    if (inStart > inEnd) return null;
    TreeNode root = TreeNode(postorder[postIndex--]);
    int inIndex = inMap[root.val]!;
    root.right = buildTreeHelper(inorder, postorder, inIndex + 1, inEnd);
    root.left = buildTreeHelper(inorder, postorder, inStart, inIndex - 1);
    return root;
  }
}