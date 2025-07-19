class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    List<int> A = nums1;
    List<int> B = nums2;
    if (A.length > B.length) {
      List<int> temp = A;
      A = B;
      B = temp;
    }
    int m = A.length;
    int n = B.length;
    int imin = 0, imax = m, halfLen = ((m + n + 1) ~/ 2);
    while (imin <= imax) {
      int i = ((imin + imax) ~/ 2);
      int j = halfLen - i;
      if (i < m && B[j - 1] > A[i]) {
        imin = i + 1;
      } else if (i > 0 && A[i - 1] > B[j]) {
        imax = i - 1;
      } else {
        int maxOfLeft;
        if (i == 0) {
          maxOfLeft = B[j - 1];
        } else if (j == 0) {
          maxOfLeft = A[i - 1];
        } else {
          maxOfLeft = A[i - 1] > B[j - 1] ? A[i - 1] : B[j - 1];
        }
        if ((m + n) % 2 == 1) {
          return maxOfLeft.toDouble();
        }
        int minOfRight;
        if (i == m) {
          minOfRight = B[j];
        } else if (j == n) {
          minOfRight = A[i];
        } else {
          minOfRight = A[i] < B[j] ? A[i] : B[j];
        }
        return (maxOfLeft + minOfRight) / 2.0;
      }
    }
    return 0.0; 
  }
}
