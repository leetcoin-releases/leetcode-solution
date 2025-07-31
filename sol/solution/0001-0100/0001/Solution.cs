public class Solution {
    public int[] TwoSum(int[] nums, int target) {
        var map = new Dictionary<int, int>(nums.Length);
        for (int i = 0; i < nums.Length; i++) {
            if (map.TryGetValue(target - nums[i], out int index)) {
                return new int[] { index, i };
            }
            map[nums[i]] = i;
        }
        return new int[] { };
    }
}