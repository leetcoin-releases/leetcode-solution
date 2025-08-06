class Solution:
    def maxArea(self, height: List[int]) -> int:
        left, right = 0, len(height) - 1
        max_area = 0
        while left < right:
            width = right - left
            current_height = min(height[left], height[right])
            max_area = max(max_area, width * current_height)
            if height[left] < height[right]:
                left += 1
            else:
                right -= 1
        return max_area