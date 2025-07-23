impl Solution {
    pub fn my_atoi(s: String) -> i32 {
        let bytes = s.as_bytes();
        let (mut i, mut sign, mut result) = (0, 1, 0);
        while i < bytes.len() && bytes[i] == b' ' { i += 1; }
        if i < bytes.len() && (bytes[i] == b'-' || bytes[i] == b'+') {
            sign = if bytes[i] == b'-' { -1 } else { 1 };
            i += 1;
        }
        while i < bytes.len() && (b'0'..=b'9').contains(&bytes[i]) {
            let digit = (bytes[i] - b'0') as i32;
            if result > (i32::MAX - digit) / 10 {
                return if sign == 1 { i32::MAX } else { i32::MIN };
            }
            result = result * 10 + digit;
            i += 1;
        }
        result * sign
    }
}
