/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} preorder
 * @param {number[]} inorder
 * @return {TreeNode}
 */
var buildTree = function(preorder, inorder) {
    const map = new Map();
    for (let i = 0; i < inorder.length; i++)
        map.set(inorder[i], i);
    let idx = 0;
    function helper(left, right) {
        if (left > right) return null;
        const rootVal = preorder[idx++];
        const root = new TreeNode(rootVal);
        root.left = helper(left, map.get(rootVal) - 1);
        root.right = helper(map.get(rootVal) + 1, right);
        return root;
    }
    return helper(0, inorder.length - 1);
};
