# [**108. Convert Sorted Array to Binary Search Tree**](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/)

Given an integer array `nums` where the elements are sorted in **ascending order**, convert it to a **height-balanced** binary search tree.

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/474383793-41aa0f26-5683-49a3-9246-0760212a4550.jpg" width="1580" height="600"/>

```md
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:
```

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/474383077-4402574c-0700-4834-875c-43d9d085f863.jpg" width="1580" height="600"/>

### **Example 2:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/474383611-5250a3f8-eb85-4bd2-bfac-ef5d658439c5.jpg" width="1580" height="600"/>

```md
Input: nums = [1,3]
Output: [3,1]
Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
```

### **Constraints:**
```md
• 1 <= nums.length <= 10⁴
• -10⁴ <= nums[i] <= 10⁴
• nums is sorted in a strictly increasing order.
```