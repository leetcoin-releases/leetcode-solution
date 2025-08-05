# [**109. Convert Sorted List to Binary Search Tree**](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/description/)

Given the `head` of a singly linked list where elements are sorted in `ascending order`, convert it to a `height-balanced` binary search tree.

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/474403481-8a4ef477-7927-467f-be2b-961094c919ff.jpg" width="1580" height="600"/>

```md
Input: head = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.
```

### **Example 2:**
```md
Input: head = []
Output: []
```

### **Constraints:**
```md
• The number of nodes in head is in the range [0, 2 * 10⁴].
• -10 <= Node.val <= 10⁵
```