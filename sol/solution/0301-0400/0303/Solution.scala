class NumArray(_nums: Array[Int]) {
    val prefixSums: Array[Int] = {
        val n = _nums.length
        val sums = new Array[Int](n + 1)
        sums(0) = 0
        var i = 0
        while (i < n) {
            sums(i + 1) = sums(i) + _nums(i)
            i += 1
        }
        sums
    }
    def sumRange(left: Int, right: Int): Int = {
       prefixSums(right + 1) - prefixSums(left) 
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * val obj = new NumArray(nums)
 * val param_1 = obj.sumRange(left,right)
 */