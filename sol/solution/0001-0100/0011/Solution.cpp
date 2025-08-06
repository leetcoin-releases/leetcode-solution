class Solution {
public:
    int maxArea(vector<int>& height) {
        int left = 0;
        int right = height.size() - 1;
        int max_water = 0;
        while (left < right) {
            max_water = max(min(height[left], height[right]) * (right - left), max_water);
            if (height[left] <= height[right]) {
                left++;
            } else {
                right--;
            }
        }
        return max_water;
    }
};