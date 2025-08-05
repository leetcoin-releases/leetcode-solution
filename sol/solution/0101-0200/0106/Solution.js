/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} inorder
 * @param {number[]} postorder
 * @return {TreeNode}
 */
class TreeNode {
    constructor(val = 0, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}
function buildTree(inorder, postorder) {
    const inorderIndexMap = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inorderIndexMap.set(inorder[i], i);
    }
    let postIndex = postorder.length - 1;
    function helper(left, right) {
        if (left > right) return null;
        const rootVal = postorder[postIndex--];
        const root = new TreeNode(rootVal);
        const index = inorderIndexMap.get(rootVal);
        root.right = helper(index + 1, right);
        root.left = helper(left, index - 1);
        return root;
    }
    return helper(0, inorder.length - 1);
}