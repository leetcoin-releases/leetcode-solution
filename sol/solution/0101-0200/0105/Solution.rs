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
    pub fn build_tree(preorder: Vec<i32>, inorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        fn helper(
            preorder: &[i32],
            inorder: &[i32],
        ) -> Option<Rc<RefCell<TreeNode>>> {
            if preorder.is_empty() || inorder.is_empty() {
                return None;
            }
            let root_val = preorder[0];
            let root = Rc::new(RefCell::new(TreeNode::new(root_val)));
            let idx = inorder.iter().position(|&x| x == root_val).unwrap();
            root.borrow_mut().left = helper(&preorder[1..=idx], &inorder[..idx]);
            root.borrow_mut().right = helper(&preorder[idx+1..], &inorder[idx+1..]);
            Some(root)
        }
        helper(&preorder, &inorder)
    }
}