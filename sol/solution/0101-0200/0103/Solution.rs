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
use std::collections::VecDeque;
impl Solution {
    pub fn zigzag_level_order(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        if root.is_none() {
            return res;
        }
        let mut queue = VecDeque::new();
        queue.push_back(root.unwrap());
        let mut left_to_right = true;
        while !queue.is_empty() {
            let n = queue.len();
            let mut level = Vec::with_capacity(n);
            for _ in 0..n {
                let node = queue.pop_front().unwrap();
                let node_ref = node.borrow();
                if left_to_right {
                    level.push(node_ref.val);
                } else {
                    level.insert(0, node_ref.val);
                }
                if let Some(left) = node_ref.left.clone() {
                    queue.push_back(left);
                }
                if let Some(right) = node_ref.right.clone() {
                    queue.push_back(right);
                }
            }
            res.push(level);
            left_to_right = !left_to_right;
        }
        res
    }
}