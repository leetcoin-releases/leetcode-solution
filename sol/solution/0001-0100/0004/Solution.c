double findMedianSortedArrays(int* nums1, int m, int* nums2, int n){
    if (m > n) return findMedianSortedArrays(nums2, n, nums1, m);
    int low = 0, high = m, halfLen = (m + n + 1) / 2;
    while (low <= high) {
        int i = (low + high) / 2;
        int j = halfLen - i;
        int maxLeftX = (i == 0) ? INT_MIN : nums1[i - 1];
        int minRightX = (i == m) ? INT_MAX : nums1[i];
        int maxLeftY = (j == 0) ? INT_MIN : nums2[j - 1];
        int minRightY = (j == n) ? INT_MAX : nums2[j];
        if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
            if ((m + n) % 2 == 0)
                return (double)( (maxLeftX > maxLeftY ? maxLeftX : maxLeftY) + (minRightX < minRightY ? minRightX : minRightY) ) / 2;
            else
                return (double)(maxLeftX > maxLeftY ? maxLeftX : maxLeftY);
        } else if (maxLeftX > minRightY) {
            high = i - 1;
        } else {
            low = i + 1;
        }
    }
    return 0.0;
}
