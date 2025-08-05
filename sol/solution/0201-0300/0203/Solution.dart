/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    ListNode dummy = ListNode(0);
    dummy.next = head;
    ListNode? curr = dummy;
    while (curr?.next != null) {
      if (curr!.next!.val == val) {
        curr.next = curr.next!.next;
      } else {
        curr = curr.next;
      }
    }
    return dummy.next;
  }
}
