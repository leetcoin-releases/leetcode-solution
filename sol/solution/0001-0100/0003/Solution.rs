use std::collections::HashMap;

impl Solution {
    pub fn length_of_longest_substring(s: String) -> i32 {
        let mut last = HashMap::new();
        let (mut res, mut start) = (0, 0);
        let cs: Vec<char> = s.chars().collect();
        for (i, c) in cs.iter().enumerate() {
            if let Some(&idx) = last.get(c) {
                if idx >= start {
                    start = idx + 1;
                }
            }
            res = res.max(i - start + 1);
            last.insert(*c, i);
        }
        res as i32
    }
}
