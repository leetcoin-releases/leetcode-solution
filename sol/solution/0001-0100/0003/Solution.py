class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        last = {}
        res = start = 0
        for i, c in enumerate(s):
            if c in last and last[c] >= start:
                start = last[c] + 1
            res = max(res, i - start + 1)
            last[c] = i
        return res
