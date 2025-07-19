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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let ans = ListNode()
        var currentL3 = ans
        var l1it = l1
        var l2it = l2
        var carry = 0
        while l1it != nil || l2it != nil || carry > 0 {
            var l3val = carry
            if let l1val = l1it?.val {
                l3val += l1val
                l1it = l1it?.next
            }
            if let l2val = l2it?.val {
                l3val += l2val
                l2it = l2it?.next
            }
            carry = l3val / 10
            let l3 = ListNode(l3val % 10)
            currentL3.next = l3
            currentL3 = l3
        }
        return ans.next
    }
}