type NumArray struct {
	prefixSum []int
}
func Constructor(nums []int) NumArray {
	prefixSum := make([]int, len(nums)+1)
	for i, num := range nums {
		prefixSum[i+1] = prefixSum[i] + num
	}
	return NumArray{prefixSum: prefixSum}
}
func (this *NumArray) SumRange(left int, right int) int {
	return this.prefixSum[right+1] - this.prefixSum[left]
}
/**
 * Your NumArray object will be instantiated and called as such:
 * obj := Constructor(nums);
 * param_1 := obj.SumRange(left,right);
 */