
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    response=[]
    buffer = 0
    while l1 || l2 || buffer != 0
        l1_val = l1 ? l1.val : 0
        l2_val = l2 ? l2.val : 0
        sum = l1_val+l2_val+buffer
        buffer = sum/10
        if buffer != 0 
         response.push(sum-10)
        else 
         response.push(sum)
        end 
        l1 = l1.next if l1
        l2 = l2.next if l2
    end
    response    
end
