/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def addTwoNumbers(l1: ListNode, l2: ListNode): ListNode = {
        val dummy = new ListNode(0)
        var curr = dummy
        var carry = 0
        var p1 = l1
        var p2 = l2
        while (p1 != null || p2 != null || carry > 0) {
            var sum = carry
            if (p1 != null) {
                sum += p1.x
                p1 = p1.next
            }
            if (p2 != null) {
                sum += p2.x
                p2 = p2.next
            }
            carry = sum / 10
            curr.next = new ListNode(sum % 10)
            curr = curr.next
        }
        dummy.next
    }
}