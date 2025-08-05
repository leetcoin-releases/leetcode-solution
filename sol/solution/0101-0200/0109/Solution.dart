/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  TreeNode? sortedListToBST(ListNode? head) {
    if (head == null) return null;
    if (head.next == null) return TreeNode(head.val);
    ListNode? slow = head, fast = head, prev;
    while (fast?.next != null && fast?.next?.next != null) {
      prev = slow;
      slow = slow?.next;
      fast = fast?.next?.next;
    }
    prev?.next = null;
    TreeNode root = TreeNode(slow!.val);
    root.left = sortedListToBST(head == slow ? null : head);
    root.right = sortedListToBST(slow.next);
    return root;
  }
}