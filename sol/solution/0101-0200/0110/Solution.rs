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
    pub fn is_balanced(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn check(node: &Option<Rc<RefCell<TreeNode>>>) -> i32 {
            if let Some(n) = node {
                let n = n.borrow();
                let left = check(&n.left);
                if left == -1 { return -1; }
                let right = check(&n.right);
                if right == -1 { return -1; }
                if (left - right).abs() > 1 { return -1; }
                return left.max(right) + 1;
            }
            0
        }
        check(&root) != -1
    }
}