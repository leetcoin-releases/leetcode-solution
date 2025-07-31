# [**103. Binary Tree ZigZag Level Order Traversal**](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/)

Given the `root` of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/472873995-9c1b6b9e-3cd0-43e1-8205-48fd98cc9bb9.jpg" width="1580" height="600"/>

```md
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
```

### **Example 2:**
```md
Input: root = [1]
Output: [[1]]
```

### **Example 3:**
```md
Input: root = []
Output: []
```

### **Constraints:**
```md
• The number of nodes in the tree is in the range [1, 2000].
• -1000 <= Node.val <= 1000
`` `