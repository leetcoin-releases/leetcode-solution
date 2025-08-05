/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sortedListToBST(head *ListNode) *TreeNode {
    if head == nil {
        return nil
    }
    if head.Next == nil {
        return &TreeNode{Val: head.Val}
    }
    slow, fast := head, head
    var prev *ListNode
    for fast != nil && fast.Next != nil {
        prev = slow
        slow = slow.Next
        fast = fast.Next.Next
    }
    if prev != nil {
        prev.Next = nil
    }
    root := &TreeNode{Val: slow.Val}
    root.Left = sortedListToBST(head)
    root.Right = sortedListToBST(slow.Next)
    return root
}