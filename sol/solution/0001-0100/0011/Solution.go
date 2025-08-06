func maxArea(height []int) int {
    left, right := 0, len(height)-1
    maxArea := 0
    for left < right {
        width := right - left
        currentHeight := height[left]
        if height[right] < currentHeight {
            currentHeight = height[right]
        }
        area := width * currentHeight
        if area > maxArea {
            maxArea = area
        }
        if height[left] < height[right] {
            left++
        } else {
            right--
        }
    }
    return maxArea
}