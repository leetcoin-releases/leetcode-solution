// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// 
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
impl Solution {
    pub fn add_two_numbers(l1: Option<Box<ListNode>>, l2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut dummy = Box::new(ListNode::new(0));
        let mut curr = &mut dummy;
        let mut carry = 0;
        let mut p1 = l1;
        let mut p2 = l2;
        while p1.is_some() || p2.is_some() || carry > 0 {
            let mut sum = carry;
            if let Some(node1) = p1 {
                sum += node1.val;
                p1 = node1.next;
            }
            if let Some(node2) = p2 {
                sum += node2.val;
                p2 = node2.next;
            }
            carry = sum / 10;
            curr.next = Some(Box::new(ListNode::new(sum % 10)));
            curr = curr.next.as_mut().unwrap();
        }
        dummy.next
    }
}