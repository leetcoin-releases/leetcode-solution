# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        n1 = 0
        n2 = 0
        i = 1
        while l1:
            n1 = l1.val*i + n1
            l1 = l1.next
            i *= 10
        i = 1
        while l2:
            n2 = l2.val*i + n2
            l2 = l2.next
            i *= 10
        x = list(map(int, str(n1+n2)))
        head = None
        current = None
        for y in range(len(x)):
            l3 = ListNode(x[-(y+1)])
            if head is None:
                head = l3
                current = l3
            else:
                current.next = l3
                current = l3
        return head