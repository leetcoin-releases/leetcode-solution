# [**203. Remove Linked List Elements**](https://leetcode.com/problems/remove-linked-list-elements/description/)

Given the `head` of a linked list and an integer `val`, remove all the nodes of the linked list that has `Node.val == val`, and return the new head.

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/474623794-9b51cdde-bc9a-4773-bfaf-3323c1ec3964.jpg" width="1580" height="600"/>

```md
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]
```

### **Example 2:**
```md
Input: head = [], val = 1
Output: []
```

### **Example 3:**
```md
Input: head = [7,7,7,7], val = 7
Output: []
```

### **Constraints:**
```md
• The number of nodes in the list is in the range [0, 10⁴].
• 1 <= Node.val <= 50
• 0 <= val <= 50
```