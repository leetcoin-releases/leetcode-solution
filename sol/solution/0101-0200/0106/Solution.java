/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    static int p, i;
    public static TreeNode buildTree(int[] inorder, int[] postorder) {
        p = postorder.length - 1;
        i = p;
        return buildTree(inorder, postorder, Integer.MAX_VALUE);
    }
    private static TreeNode buildTree(int[] inorder, int[] postorder, int parentVal) {
        if (i < 0 || parentVal == inorder[i]) {
            return null;
        }
        int val = postorder[p];
        --p;
        TreeNode root = new TreeNode(val);
        root.right = buildTree(inorder, postorder, val);
        --i;
        root.left = buildTree(inorder, postorder, parentVal);
        return root;
    }
}