# [**1. Two Sum**](https://leetcode.com/problems/two-sum/description/)

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.<br>
You may assume that each input would have **exactly one solution**, and you may not use the same element twice.<br>
You can return the answer in any order.

### **Example 1:**
```md
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
```

### **Example 2:**
```md
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

### **Example 3:**
```md
Input: nums = [3,3], target = 6
Output: [0,1]
```

### **Constraints:**
```md
• 2 <= nums.length <= 104
• -109 <= nums[i] <= 109
• -109 <= target <= 109
• Only one valid answer exists.
```

### **Follow-up:**
Can you come up with an algorithm that is less than `O(n²)` time complexity?