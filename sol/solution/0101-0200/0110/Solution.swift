/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        func check(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let left = check(node.left)
            if left == -1 { return -1 }
            let right = check(node.right)
            if right == -1 { return -1 }
            if abs(left - right) > 1 { return -1 }
            return max(left, right) + 1
        }
        return check(root) != -1
    }
}
