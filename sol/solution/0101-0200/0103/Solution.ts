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
function zigzagLevelOrder(root: TreeNode | null): number[][] {
    if (!root) return [];
    const result: number[][] = [];
    const queue: TreeNode[] = [root];
    let leftToRight = true;
    while (queue.length) {
        const levelSize = queue.length;
        const level: number[] = [];
        for (let i = 0; i < levelSize; i++) {
            const node = queue.shift()!;
            if (leftToRight) {
                level.push(node.val);
            } else {
                level.unshift(node.val);
            }
            if (node.left) queue.push(node.left);
            if (node.right) queue.push(node.right);
        }
        result.push(level);
        leftToRight = !leftToRight;
    }
    return result;
}