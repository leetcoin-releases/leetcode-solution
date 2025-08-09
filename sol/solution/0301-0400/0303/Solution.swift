class NumArray {
    private var prefixSums: [Int]
    init(_ nums: [Int]) {
        prefixSums = [0]
        for num in nums {
            prefixSums.append(prefixSums.last! + num)
        }
    }
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return prefixSums[right + 1] - prefixSums[left]
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */