# [**11. Container With Most Water**](https://leetcode.com/problems/container-with-most-water/description/)

You are given an integer array `height` of length `n`. There are `n` vertical lines drawn such that the two endpoints of the `iᵗʰ` line are `(i, 0)` and `(i, height[i])`.<br>
Find two lines that together with the x-axis form a container, such that the container contains the most water.<br>
Return the maximum amount of water a container can store.<br>
**Notice** that you may not slant the container.<br>

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/471224809-c4e55b3c-93bd-490d-8408-2bb8d8ac0a9d.jpg" width="1580" height="600"/>

```md
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
```

### **Example 2:**
```md
Input: height = [1,1]
Output: 1
```

### **Constraints:**
```md
• n == height.length
• 2 <= n <= 10⁵
• 0 <= height[i] <= 10⁴
```