int maxArea(int* height, int heightSize) {
    int left = 0, right = heightSize - 1;
    int maxArea = 0;
    while (left < right) {
        int width = right - left;
        int currentHeight = height[left] < height[right] ? height[left] : height[right];
        int area = width * currentHeight;
        maxArea = maxArea > area ? maxArea : area;
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    return maxArea;
}