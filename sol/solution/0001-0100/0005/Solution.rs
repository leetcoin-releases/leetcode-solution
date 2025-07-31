impl Solution {
    pub fn longest_palindrome(s: String) -> String {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut start = 0;
        let mut max_len = 1;   
        for i in 0..n {
            let mut left = i;
            let mut right = i;
            while left < n && right < n && chars[left] == chars[right] {
                if right - left + 1 > max_len {
                    start = left;
                    max_len = right - left + 1;
                }
                if left == 0 { break; }
                left -= 1;
                right += 1;
            }
            left = i;
            right = i + 1;
            while left < n && right < n && chars[left] == chars[right] {
                if right - left + 1 > max_len {
                    start = left;
                    max_len = right - left + 1;
                }
                if left == 0 { break; }
                left -= 1;
                right += 1;
            }
        }
        s[start..start + max_len].to_string()
    }
}