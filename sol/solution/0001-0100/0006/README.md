# [**6. Zigzag Conversion**](https://leetcode.com/problems/zigzag-conversion/description/)

The string `"PAYPALISHIRING"` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

```md
P   A   H   N
A P L S I I G
Y   I   R
```

And then read line by line: `"PAHNAPLSIIGYIR"`<br>
Write the code that will take a string and make this conversion given a number of rows:

> `string convert(string s, int numRows);`

### **Example 1:**
```md
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

### **Example 2:**
```md
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

### **Example 3:**
```md
Input: s = "A", numRows = 1
Output: "A"
```

### **Constraints:**
```md
• 1 <= s.length <= 1000
• s consists of English letters (lower-case and upper-case), ',' and '.'.
• 1 <= numRows <= 1000
```