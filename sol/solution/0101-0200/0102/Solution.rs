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
    pub fn level_order(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        if root.is_none() { return res; }
        let mut queue = std::collections::VecDeque::new();
        queue.push_back(root);
        while !queue.is_empty() {
            let sz = queue.len();
            let mut level = Vec::new();
            for _ in 0..sz {
                if let Some(Some(node)) = queue.pop_front() {
                    let node = node.borrow();
                    level.push(node.val);
                    if node.left.is_some() { queue.push_back(node.left.clone()); }
                    if node.right.is_some() { queue.push_back(node.right.clone()); }
                }
            }
            res.push(level);
        }
        res
    }
}
