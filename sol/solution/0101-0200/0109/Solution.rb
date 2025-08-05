# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
    return nil if head.nil?
    return TreeNode.new(head.val) if head.next.nil?
    slow = head
    fast = head
    prev = nil
    while fast && fast.next
        prev = slow
        slow = slow.next
        fast = fast.next.next
    end
    prev.next = nil if prev && prev != slow
    root = TreeNode.new(slow.val)
    root.left = sorted_list_to_bst(prev.nil? ? nil : head)
    root.right = sorted_list_to_bst(slow.next)
    root
end
