public class Solution {
    public int MaxArea(int[] height) {
        int left = 0, right = height.Length - 1;
        int maxArea = 0;
        while (left < right) {
            int width = right - left;
            int currentHeight = Math.Min(height[left], height[right]);
            maxArea = Math.Max(maxArea, width * currentHeight);
            if (height[left] < height[right]) {
                left++;
            } else {
                right--;
            }
        }
        return maxArea;
    }
}