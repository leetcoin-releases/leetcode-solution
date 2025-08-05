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
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        List<List<Integer>> ans = new LinkedList<>();
        bfs(root, ans, 0);
        return ans;
    }
     public void bfs(TreeNode root, List<List<Integer>>ans, int level) {
        if(root == null) return;
        if(ans.size() == level) {
        ans.add(0, new ArrayList<>());
        }
        ans.get(ans.size() -1- level).add(root.val);
        bfs(root.left, ans, level+1);
        bfs(root.right, ans, level+1);
    }
}