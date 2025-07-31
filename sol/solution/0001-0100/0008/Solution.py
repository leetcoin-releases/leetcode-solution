class Solution:
    def myAtoi(self, s: str) -> int:
        i, n, sign, result = 0, len(s), 1, 0
        while i < n and s[i] == ' ': i += 1
        if i < n and s[i] in '+-': sign = -1 if s[i] == '-' else 1; i += 1
        while i < n and s[i].isdigit():
            digit = int(s[i])
            if result > (2**31 - 1 - digit) // 10:
                return -2**31 if sign == -1 else 2**31 - 1
            result = result * 10 + digit
            i += 1
        return sign * result