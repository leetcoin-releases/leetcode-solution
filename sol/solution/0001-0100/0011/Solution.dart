class Solution {
  int maxArea(List<int> height) {
    int left = 0, right = height.length - 1;
    int maxArea = 0;
    while (left < right) {
      int width = right - left;
      int currentHeight = height[left] < height[right] ? height[left] : height[right];
      maxArea = maxArea > (width * currentHeight) ? maxArea : (width * currentHeight);
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }
    return maxArea;
  }
}