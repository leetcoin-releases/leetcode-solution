# [**301. Remove Invalid Parentheses**](https://leetcode.com/problems/remove-invalid-parentheses/description/)

Given a string `s` that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.<br>
Return a list of **unique strings** that are valid with the minimum number of removals. You may return the answer in **any order**.<br>

### **Example 1:**
```md
Input: s = "()())()"
Output: ["(())()","()()()"]
```

### **Example 2:**
```md
Input: s = "(a)())()"
Output: ["(a())()","(a)()()"]
```

### **Example 3:**
```md
Input: s = ")("
Output: [""]
```

### **Constraints:**
```md
• 1 <= s.length <= 25
• s consists of lowercase English letters and parentheses '(' and ')'.
• There will be at most 20 parentheses in s.
```