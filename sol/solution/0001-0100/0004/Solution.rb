# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    s = (nums1+nums2).sort
    s.size.odd? ? s.at(s.size/2) : (s.at((s.size/2)-1)+s.at((s.size/2)))/2.0
end
