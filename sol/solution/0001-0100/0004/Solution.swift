class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2,nums1)
        }
        var low = 0
        var finalElement = (nums1.count+nums2.count+1)/2
        var high = nums1.count
        while low<=high {
            var mid1 = (low+high)/2
            var mid2 = finalElement - mid1
            var l1 = Int.min
            var l2 = Int.min
            var r1 = Int.max
            var r2 = Int.max
            if mid1 < nums1.count {
                r1 = nums1[mid1]
            }
            if mid2 < nums2.count {
                r2 = nums2[mid2]
            }
            if mid1-1 >= 0 {
                l1 = nums1[mid1-1]
            }
            if mid2-1 >= 0 {
                l2 = nums2[mid2-1]
            }
            if l1<=r2 && l2<=r1 {
                if (nums1.count+nums2.count)%2 == 0 {
                    return Double(max(l1,l2)+min(r1,r2))/2.0
                } else {
                    return Double(max(l1,l2))
                }
            } else if l1 > r2 {
                high = mid1-1
            } else {
                low = mid1+1
            }
        }
        return -1
    }
}
