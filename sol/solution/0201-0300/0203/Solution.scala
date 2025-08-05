/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
  def removeElements(head: ListNode, `val`: Int): ListNode = {
    val dummy = new ListNode(0)
    dummy.next = head
    var curr = dummy
    while (curr.next != null) {
      if (curr.next.x == `val`)
        curr.next = curr.next.next
      else
        curr = curr.next
    }
    dummy.next
  }
}
