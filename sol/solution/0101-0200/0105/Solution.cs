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
    public TreeNode BuildTree(int[] preorder, int[] inorder) {        
        Dictionary<int, int> dict = new Dictionary<int, int>();
        for (int i = 0; i < inorder.Length; i++) dict[inorder[i]] = i;
        return BuildTreeNode(0, preorder.Length - 1, 0, inorder.Length - 1);
        TreeNode BuildTreeNode(int preStartIdx, int preEndIdx, int inStartIdx, int inEndIdx){
            if (preStartIdx > preEndIdx || inStartIdx > inEndIdx) return null;
            int root = preorder[preStartIdx];
            TreeNode node = new TreeNode(root);
            int InorderIdx = dict[root];
            int InorderLeftLen = InorderIdx - inStartIdx;
            node.left = BuildTreeNode(preStartIdx + 1, preStartIdx + InorderLeftLen, inStartIdx, InorderIdx - 1);
            node.right = BuildTreeNode(preStartIdx + InorderLeftLen + 1, preEndIdx, InorderIdx + 1, inEndIdx);
            return node;
        }
    }
}