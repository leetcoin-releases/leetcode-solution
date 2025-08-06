function maxArea(height: number[]): number {
    let left: number = 0, right: number = height.length - 1;
    let maxArea: number = 0;
    while (left < right) {
        const width: number = right - left;
        const currentHeight: number = Math.min(height[left], height[right]);
        maxArea = Math.max(maxArea, width * currentHeight);
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    return maxArea;
}