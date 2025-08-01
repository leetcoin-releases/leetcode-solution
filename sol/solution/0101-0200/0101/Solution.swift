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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
            if t1 == nil && t2 == nil { return true }
            if t1 == nil || t2 == nil { return false }
            return t1!.val == t2!.val && isMirror(t1!.left, t2!.right) && isMirror(t1!.right, t2!.left)
        }
        return isMirror(root, root)
    }
}
