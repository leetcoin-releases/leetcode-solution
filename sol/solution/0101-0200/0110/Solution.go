/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isBalanced(root *TreeNode) bool {
    var check func(*TreeNode) int
    check = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        left := check(node.Left)
        if left == -1 {
            return -1
        }
        right := check(node.Right)
        if right == -1 {
            return -1
        }
        if abs(left - right) > 1 {
            return -1
        }
        return max(left, right) + 1
    }
    return check(root) != -1
}
func max(a, b int) int { if a > b { return a }; return b }
func abs(x int) int { if x < 0 { return -x }; return x }