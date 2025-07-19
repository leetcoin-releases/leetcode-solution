/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
        val dummy = ListNode(0)
        var curr = dummy
        var carry = 0
        var p1 = l1
        var p2 = l2
        while (p1 != null || p2 != null || carry > 0) {
            var sum = carry
            if (p1 != null) {
                sum += p1.`val`
                p1 = p1.next
            }
            if (p2 != null) {
                sum += p2.`val`
                p2 = p2.next
            }
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!!
        }
        return dummy.next
    }
}