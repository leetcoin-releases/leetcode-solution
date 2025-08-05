/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var curr: ListNode? = dummy
        while curr?.next != nil {
            if curr?.next?.val == val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return dummy.next
    }
}
