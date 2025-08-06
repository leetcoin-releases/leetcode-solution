# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    return 0 if height.nil? || height.length < 2
    left, right = 0, height.length - 1
    max_area = 0
    while left < right
        width = right - left
        current_height = [height[left], height[right]].min
        max_area = [max_area, width * current_height].max
        if height[left] < height[right]
            left += 1
        else
            right -= 1
        end
    end
    max_area
end