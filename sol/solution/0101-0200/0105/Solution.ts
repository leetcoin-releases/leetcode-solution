/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    const map = new Map<number, number>();
    inorder.forEach((val, i) => map.set(val, i));
    let idx = 0;
    function helper(left: number, right: number): TreeNode | null {
        if (left > right) return null;
        const rootVal = preorder[idx++];
        const root = new TreeNode(rootVal);
        root.left = helper(left, map.get(rootVal)! - 1);
        root.right = helper(map.get(rootVal)! + 1, right);
        return root;
    }
    return helper(0, inorder.length - 1);
}
