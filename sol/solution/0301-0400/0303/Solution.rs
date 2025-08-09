struct NumArray {
    prefix_sum: Vec<i32>,
}
impl NumArray {
    fn new(nums: Vec<i32>) -> Self {
        let mut prefix_sum = Vec::with_capacity(nums.len() + 1);
        prefix_sum.push(0);
        for &num in &nums {
            prefix_sum.push(prefix_sum.last().unwrap() + num);
        }
        NumArray { prefix_sum }
    }
    fn sum_range(&self, left: i32, right: i32) -> i32 {
        self.prefix_sum[(right + 1) as usize] - self.prefix_sum[left as usize]
    }
}
