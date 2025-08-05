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
    pub fn sorted_array_to_bst(nums: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        fn build_bst(nums: &Vec<i32>, left: isize, right: isize) -> Option<Rc<RefCell<TreeNode>>> {
            if left > right {
                return None;
            }
            let mid = left + (right - left) / 2;
            let mid_usize = mid as usize;
            let root = Rc::new(RefCell::new(TreeNode::new(nums[mid_usize])));
            root.borrow_mut().left = build_bst(nums, left, mid - 1);
            root.borrow_mut().right = build_bst(nums, mid + 1, right);
            Some(root)
        }
        build_bst(&nums, 0, nums.len() as isize - 1)
    }
}