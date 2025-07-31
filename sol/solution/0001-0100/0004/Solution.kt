class Solution {
    fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
        val m = nums1.size
        val n = nums2.size
        if (m > n) return findMedianSortedArrays(nums2, nums1)
        var imin = 0
        var imax = m
        val halfLen = (m + n + 1) / 2
        while (imin <= imax) {
            val i = (imin + imax) / 2
            val j = halfLen - i
            if (i < m && nums2[j - 1] > nums1[i]) {
                imin = i + 1
            } else if (i > 0 && nums1[i - 1] > nums2[j]) {
                imax = i - 1
            } else {
                val maxLeft = when {
                    i == 0 -> nums2[j - 1]
                    j == 0 -> nums1[i - 1]
                    else -> maxOf(nums1[i - 1], nums2[j - 1])
                }
                if ((m + n) % 2 == 1) return maxLeft.toDouble()
                val minRight = when {
                    i == m -> nums2[j]
                    j == n -> nums1[i]
                    else -> minOf(nums1[i], nums2[j])
                }
                return (maxLeft + minRight) / 2.0
            }
        }
        throw IllegalArgumentException("Input arrays are not sorted or invalid.")
    }
}
