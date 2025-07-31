object Solution {
    def findMedianSortedArrays(nums1: Array[Int], nums2: Array[Int]): Double = {
        val m = nums1.length
        val n = nums2.length
        if (m > n) return findMedianSortedArrays(nums2, nums1)
        var imin = 0
        var imax = m
        val halfLen = (m + n + 1) / 2
        while (imin <= imax) {
            val i = (imin + imax) / 2
            val j = halfLen - i
            if (i < m && nums2(j - 1) > nums1(i)) {
                imin = i + 1
            } else if (i > 0 && nums1(i - 1) > nums2(j)) {
                imax = i - 1
            } else {
                var maxLeft = 0
                if (i == 0) maxLeft = nums2(j - 1)
                else if (j == 0) maxLeft = nums1(i - 1)
                else maxLeft = Math.max(nums1(i - 1), nums2(j - 1))
                if ((m + n) % 2 == 1) return maxLeft
                var minRight = 0
                if (i == m) minRight = nums2(j)
                else if (j == n) minRight = nums1(i)
                else minRight = Math.min(nums1(i), nums2(j))
                return (maxLeft + minRight) / 2.0
            }
        }
        0.0
    }
}
