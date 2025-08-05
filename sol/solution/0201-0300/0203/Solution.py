# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next\
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        current_node = head
        dummy = ListNode(-1)
        dummy.next = head
        if current_node == None:
            return None
        prev_node = dummy
        next_node = current_node.next
        while current_node:
            if current_node.val == val:
                prev_node.next = next_node
            else:
                prev_node = prev_node.next
            current_node = current_node.next
            next_node = current_node.next if current_node else None
        return dummy.next