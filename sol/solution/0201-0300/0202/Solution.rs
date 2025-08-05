impl Solution {
    pub fn is_happy(n: i32) -> bool {
        fn get_next(mut num: i32) -> i32 {
            let mut sum = 0;
            while num > 0 {
                let d = num % 10;
                sum += d * d;
                num /= 10;
            }
            sum
        }
        let (mut slow, mut fast) = (n, get_next(n));
        while fast != 1 && slow != fast {
            slow = get_next(slow);
            fast = get_next(get_next(fast));
        }
        fast == 1
    }
}
