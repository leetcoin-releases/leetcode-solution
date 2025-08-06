class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxArea = 0
        while left < right {
            let width = right - left
            let currentHeight = min(height[left], height[right])
            maxArea = max(maxArea, width * currentHeight)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}