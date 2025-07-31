/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
var zigzagLevelOrder = function(root) {
    if (!root) return [];
    const result = [];
    let queue = [root];
    let leftToRight = true;
    while (queue.length) {
        const level = [];
        const nextQueue = [];
        for (let node of queue) {
            level.push(node.val);
            if (node.left) nextQueue.push(node.left);
            if (node.right) nextQueue.push(node.right);
        }
        if (!leftToRight) level.reverse();
        result.push(level);
        queue = nextQueue;
        leftToRight = !leftToRight;
    }
    return result;
};