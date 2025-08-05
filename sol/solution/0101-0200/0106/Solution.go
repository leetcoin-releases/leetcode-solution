/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func buildTree(inorder []int, postorder []int) *TreeNode {
    idx := make(map[int]int, len(inorder))
    for i, v := range inorder { idx[v] = i }
    var build func(il, ir int) *TreeNode
    build = func(il, ir int) *TreeNode {
        if il > ir { return nil }
        val := postorder[len(postorder)-1]
        postorder = postorder[:len(postorder)-1]
        node := &TreeNode{Val: val}
        split := idx[val]
        node.Right = build(split+1, ir)
        node.Left  = build(il, split-1)
        return node
    }
    return build(0, len(inorder)-1)
}