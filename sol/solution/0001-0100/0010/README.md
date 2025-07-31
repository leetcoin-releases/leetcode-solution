# [**10. Regular Expression Matching**](https://leetcode.com/problems/regular-expression-matching/description/)

Given an input string `s` and a pattern `p`, implement regular expression matching with support for `'.'` and `'*'` where:<br>
- `'.'` Matches any single character.​​​​
- `'*'` Matches zero or more of the preceding element.<br>
The matching should cover the **entire** input string (not partial).

### **Example 1:**
```md
Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
```

### **Example 2:**
```md
Input: s = "aa", p = "a*"
Output: true
Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
```

### **Example 3:**
```md
Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
```

### **Constraints:**
```md
• 1 <= s.length <= 20
• 1 <= p.length <= 20
• `s` contains only lowercase English letters.
• `p` contains only lowercase English letters, `'.'`, and `'*'`.
• It is guaranteed for each appearance of the character `'*'`, there will be a previous valid character to match.
```