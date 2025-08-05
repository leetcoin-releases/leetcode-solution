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
function buildTree(inorder: number[], postorder: number[]): TreeNode | null {
    const inMap: Map<number, number> = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inMap.set(inorder[i], i);
    }
    let postIndex: number = postorder.length - 1;
    function buildTreeHelper(inStart: number, inEnd: number): TreeNode | null {
        if (inStart > inEnd) return null;
        const root: TreeNode = new TreeNode(postorder[postIndex--]);
        const inIndex: number = inMap.get(root.val)!;
        root.right = buildTreeHelper(inIndex + 1, inEnd);
        root.left = buildTreeHelper(inStart, inIndex - 1);
        return root;
    }
    return buildTreeHelper(0, inorder.length - 1);
}