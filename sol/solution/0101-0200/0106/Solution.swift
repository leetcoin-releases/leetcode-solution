/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    private var postIndex: Int = 0
    private var inMap: [Int: Int] = [:]
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for (i, val) in inorder.enumerated() {
            inMap[val] = i
        }
        postIndex = postorder.count - 1
        return buildTreeHelper(inorder, postorder, 0, inorder.count - 1)
    }
    private func buildTreeHelper(_ inorder: [Int], _ postorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if inStart > inEnd {
            return nil
        }
        let root = TreeNode(postorder[postIndex])
        postIndex -= 1
        let inIndex = inMap[root.val]!
        root.right = buildTreeHelper(inorder, postorder, inIndex + 1, inEnd)
        root.left = buildTreeHelper(inorder, postorder, inStart, inIndex - 1)
        return root
    }
}