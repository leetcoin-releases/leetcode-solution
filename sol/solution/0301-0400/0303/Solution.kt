class NumArray(var nums: IntArray) {
    var prefix  = 0
    init{
        for(i in nums.indices){
            if(i == 0)
            prefix = nums[i]
            else{
                nums[i] = prefix + nums[i]
            prefix = nums[i]
            }
        }
    }
    fun sumRange(left: Int, right: Int): Int {
        if(left == 0){
            return nums[right]
        }else
        return nums[right] - nums[left - 1]
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * var obj = NumArray(nums)
 * var param_1 = obj.sumRange(left,right)
 */