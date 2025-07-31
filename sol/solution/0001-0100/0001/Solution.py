class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        d = {}
        for i, m in enumerate(nums):
            if (n := target - m) in d:
                return [d[n], i]
            d[m] = i