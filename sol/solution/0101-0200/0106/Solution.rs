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
use std::collections::HashMap;
impl Solution {
    pub fn build_tree(inorder: Vec<i32>, postorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut in_map: HashMap<i32, usize> = HashMap::new();
        for (i, &val) in inorder.iter().enumerate() {
            in_map.insert(val, i);
        }
        let mut post_index = postorder.len() as i32 - 1;
        fn build_tree_helper(
            inorder: &Vec<i32>,
            postorder: &Vec<i32>,
            in_start: i32,
            in_end: i32,
            post_index: &mut i32,
            in_map: &HashMap<i32, usize>
        ) -> Option<Rc<RefCell<TreeNode>>> {
            if in_start > in_end {
                return None;
            }
            let root = Rc::new(RefCell::new(TreeNode::new(postorder[*post_index as usize])));
            *post_index -= 1;
            let in_index = *in_map.get(&root.borrow().val).unwrap() as i32;
            root.borrow_mut().right = build_tree_helper(inorder, postorder, in_index + 1, in_end, post_index, in_map);
            root.borrow_mut().left = build_tree_helper(inorder, postorder, in_start, in_index - 1, post_index, in_map);
            Some(root)
        }
        build_tree_helper(&inorder, &postorder, 0, inorder.len() as i32 - 1, &mut post_index, &in_map)
    }
}