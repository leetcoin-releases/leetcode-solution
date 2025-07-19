func twoSum(nums []int, target int) []int {
	d = map[int]int{}
	for i := 0; i < len(nums); i++ {
		if j, ok := d[target-nums[i]]; ok {
			return []int{j, i}
		}
		d[nums[i]] = i
	}
}