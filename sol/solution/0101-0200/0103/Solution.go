func zigzagLevelOrder(root *TreeNode) [][]int {
	if root == nil {
		return [][]int{}
	}
	var res [][]int
	queue := []*TreeNode{root}
	leftToRight := true
	for len(queue) > 0 {
		n := len(queue)
		level := make([]int, n)
		for i := 0; i < n; i++ {
			node := queue[0]
			queue = queue[1:]
			if leftToRight {
				level[i] = node.Val
			} else {
				level[n-1-i] = node.Val
			}
			if node.Left != nil {
				queue = append(queue, node.Left)
			}
			if node.Right != nil {
				queue = append(queue, node.Right)
			}
		}
		res = append(res, level)
		leftToRight = !leftToRight
	}
	return res
}