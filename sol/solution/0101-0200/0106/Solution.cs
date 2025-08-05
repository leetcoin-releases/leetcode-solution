/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    private int postIndex;
    private Dictionary<int, int> inMap;
    public TreeNode BuildTree(int[] inorder, int[] postorder) {
        inMap = new Dictionary<int, int>();
        for (int i = 0; i < inorder.Length; i++) {
            inMap[inorder[i]] = i;
        }
        postIndex = postorder.Length - 1;
        return BuildTreeHelper(inorder, postorder, 0, inorder.Length - 1);
    }
    private TreeNode BuildTreeHelper(int[] inorder, int[] postorder, int inStart, int inEnd) {
        if (inStart > inEnd) return null;
        TreeNode root = new TreeNode(postorder[postIndex--]);
        int inIndex = inMap[root.val];
        root.right = BuildTreeHelper(inorder, postorder, inIndex + 1, inEnd);
        root.left = BuildTreeHelper(inorder, postorder, inStart, inIndex - 1);
        return root;
    }
}