# [**302. Smallest Rectangle Enclosing Black Pixels**](https://leetcode.com/problems/smallest-rectangle-enclosing-black-pixels/description/)

You are given an `m x n` binary matrix `image` where `0` represents a white pixel and `1` represents a black pixel.<br>
The black pixels are connected (i.e., there is only one black region). Pixels are connected horizontally and vertically.<br>
Given two integers x and y that represents the location of one of the black pixels, **return the area of the smallest (axis-aligned) rectangle that encloses all black pixels.**<br>
You must write an algorithm with less than `O(mn)` runtime complexity<br>

### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode-solution/refs/heads/main/res/pin/476292957-eb2bb626-fec0-4ac1-be20-d17cbc97fde1.jpg" width="1580" height="600"/>

```md
Input: image = [["0","0","1","0"],["0","1","1","0"],["0","1","0","0"]], x = 0, y = 2
Output: 6
```

### **Example 2:**
```md
Input: image = [["1"]], x = 0, y = 0
Output: 1
```

### **Constraints:**
```md
• m == image.length
• n == image[i].length
• 1 <= m, n <= 100
• image[i][j] is either '0' or '1'.
• 0 <= x < m
• 0 <= y < n
• image[x][y] == '1'.
• The black pixels in the image only form one component.
```