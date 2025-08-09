public class NumArray {
    private int[] prefixSum;
    public NumArray(int[] nums) {
        prefixSum = new int[nums.Length + 1];
        for (int i = 0; i < nums.Length; i++) {
            prefixSum[i + 1] = prefixSum[i] + nums[i];
        }
    }
    public int SumRange(int left, int right) {
        return prefixSum[right + 1] - prefixSum[left];
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * int param_1 = obj.SumRange(left,right);
 */