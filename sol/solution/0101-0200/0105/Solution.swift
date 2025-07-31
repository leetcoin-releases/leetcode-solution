class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorderIndex = 0
        var inorderIndexMap = [Int: Int]()
        for (i, val) in inorder.enumerated() {
            inorderIndexMap[val] = i
        }
        func helper(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let rootVal = preorder[preorderIndex]
            preorderIndex += 1
            let root = TreeNode(rootVal)
            let inorderIndex = inorderIndexMap[rootVal]!
            root.left = helper(left, inorderIndex - 1)
            root.right = helper(inorderIndex + 1, right)
            return root
        }
        return helper(0, inorder.count - 1)
    }
}