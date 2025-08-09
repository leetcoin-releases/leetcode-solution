class NumArray {
  List<int> arr = [];
  NumArray(List<int> nums) {
    List<int> prefixSum = [];
    int currSum = 0;
    for (int i = 0; i < nums.length; i++) {
      currSum += nums[i];
      prefixSum.add(currSum);
    }
    arr = prefixSum;
  }
  int sumRange(int left, int right) {
    if (left - 1 >= 0) {
      return arr[right] - arr[left - 1];
    } else {
      return arr[right];
    }
  }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = NumArray(nums);
 * int param1 = obj.sumRange(left,right);
 */