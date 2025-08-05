/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def sortedListToBST(head: ListNode): TreeNode = {
        def findMiddle(start: ListNode, end: ListNode): ListNode = {
            var slow = start
            var fast = start
            while (fast != end && fast.next != end) {
                slow = slow.next
                fast = fast.next.next
            }
            slow
        }
        def convertListToBST(start: ListNode, end: ListNode): TreeNode = {
            if (start == end) return null
            val mid = findMiddle(start, end)
            val node = new TreeNode(mid.x)
            node.left = convertListToBST(start, mid)
            node.right = convertListToBST(mid.next, end)
            node
        }
        convertListToBST(head, null)
    }
}