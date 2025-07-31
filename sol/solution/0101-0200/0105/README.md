# [**105. Construct Binary Tree from Preorder and Inorder Traversal**](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/)

Given two integer arrays `preorder` and `inorder` where preorder is the preorder traversal of a binary tree and `inorder` is the inorder traversal of the same tree, construct and return the binary tree.

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/472897322-2db7c7d7-29bf-407c-9bf7-4a4a4b0e9a5e.jpg" width="1580" height="600"/>

```md
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```

### **Example 2:**
```md
Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

### **Constraints:**
```md
• 1 <= preorder.length <= 3000
• inorder.length == preorder.length
• -3000 <= preorder[i], inorder[i] <= 3000
• preorder and inorder consist of unique values.
• Each value of inorder also appears in preorder.
• preorder is guaranteed to be the preorder traversal of the tree.
• inorder is guaranteed to be the inorder traversal of the tree.
```