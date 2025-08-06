class Solution {
    fun threeSum(nums: IntArray): List<List<Int>> {
        nums.sort()
        val res = mutableListOf<List<Int>>()
        for (i in 0 until nums.size - 2) {
            if (i > 0 && nums[i] == nums[i - 1]) continue
            var l = i + 1
            var r = nums.size - 1
            while (l < r) {
                val sum = nums[i] + nums[l] + nums[r]
                when {
                    sum < 0 -> l++
                    sum > 0 -> r--
                    else -> {
                        res.add(listOf(nums[i], nums[l], nums[r]))
                        while (l < r && nums[l] == nums[l + 1]) l++
                        while (l < r && nums[r] == nums[r - 1]) r--
                        l++
                        r--
                    }
                }
            }
        }
        return res
    }
}
