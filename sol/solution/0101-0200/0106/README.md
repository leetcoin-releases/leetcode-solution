# [**106. Construct Binary Tree from Inorder and Postorder Traversal**](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/)

Given two integer arrays `inorder` and `postorder` where `inorder` is the inorder traversal of a binary tree and `postorder` is the postorder traversal of the same tree, construct and return the binary tree.

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/472897322-2db7c7d7-29bf-407c-9bf7-4a4a4b0e9a5e.jpg" width="1580" height="600"/>

```md
Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
Output: [3,9,20,null,null,15,7]
```

### **Example 2:**
```md
Input: inorder = [-1], postorder = [-1]
Output: [-1]
```

### **Constraints:**
```md
• 1 <= inorder.length <= 3000
• postorder.length == inorder.length
• -3000 <= preorder[i], inorder[i] <= 3000
• inorder and postorder consist of unique values.
• Each value of postorder also appears in inorder.
• inorder is guaranteed to be the inorder traversal of the tree.
• postorder is guaranteed to be the postorder traversal of the tree.
```