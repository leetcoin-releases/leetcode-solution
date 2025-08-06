impl Solution {
    pub fn roman_to_int(s: String) -> i32 {
        let map = |c| match c {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000, _ => 0};
        let chars: Vec<char> = s.chars().collect();
        let mut res = 0;
        for i in 0..chars.len() {
            let val = map(chars[i]);
            if i + 1 < chars.len() && val < map(chars[i + 1]) {
                res -= val;
            } else {
                res += val;
            }
        }
        res
    }
}
