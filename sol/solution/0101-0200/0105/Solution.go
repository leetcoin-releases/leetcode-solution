/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func buildTree(preorder []int, inorder []int) *TreeNode {
    idx := 0
    inMap := make(map[int]int)
    for i, v := range inorder {
        inMap[v] = i
    }
    var helper func(int, int) *TreeNode
    helper = func(left, right int) *TreeNode {
        if left > right {
            return nil
        }
        rootVal := preorder[idx]
        idx++
        root := &TreeNode{Val: rootVal}
        root.Left = helper(left, inMap[rootVal]-1)
        root.Right = helper(inMap[rootVal]+1, right)
        return root
    }
    return helper(0, len(inorder)-1)
}
