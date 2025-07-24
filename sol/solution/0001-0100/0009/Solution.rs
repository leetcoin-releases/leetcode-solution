impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false;
        }
        let mut reversed = 0;
        let mut num = x;
        while num > reversed {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        num == reversed || num == reversed / 10
    }
}