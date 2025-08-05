/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

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
function sortedListToBST(head: ListNode | null): TreeNode | null {
    if (!head) return null;
    if (!head.next) return new TreeNode(head.val);
    let slow = head, fast = head, prev = null;
    while (fast && fast.next) {
        prev = slow;
        slow = slow.next!;
        fast = fast.next.next!;
    }
    if (prev) prev.next = null;
    const root = new TreeNode(slow!.val);
    root.left = sortedListToBST(head === slow ? null : head);
    root.right = sortedListToBST(slow!.next);
    return root;
}
