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
// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::rc::Rc;
use std::cell::RefCell;
impl Solution {
    pub fn sorted_list_to_bst(mut head: Option<Box<ListNode>>) -> Option<Rc<RefCell<TreeNode>>> {
        if head.is_none(){
            return None;
        }
        let mut nums:Vec<i32> = vec![];
        while let Some(node) = head{
            nums.push(node.val);
            head = node.next;
        }
        fn recursion(nums:&Vec<i32>, start_idx:usize, end_idx:usize) -> Option<Rc<RefCell<TreeNode>>>{
            if start_idx > end_idx{
                return None;
            }
            let mid = start_idx + (end_idx - start_idx + 1)/2;
            let node = TreeNode{
                val: nums[mid],
                left: if mid == 0 {None} else {recursion(nums, start_idx, mid - 1)},
                right: if mid == nums.len() {None} else {recursion(nums, mid + 1, end_idx)}
            };
            Some(Rc::new(RefCell::new(node)))
        }
        recursion(&nums, 0, nums.len()-1)
    }
}