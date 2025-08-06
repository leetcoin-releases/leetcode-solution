class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res = [[Int]]()
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] { continue }
            var l = i + 1, r = nums.count - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if sum < 0 {
                    l += 1
                } else if sum > 0 {
                    r -= 1
                } else {
                    res.append([nums[i], nums[l], nums[r]])
                    while l < r && nums[l] == nums[l + 1] { l += 1 }
                    while l < r && nums[r] == nums[r - 1] { r -= 1 }
                    l += 1
                    r -= 1
                }
            }
        }
        return res
    }
}
