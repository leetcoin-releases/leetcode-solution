use std::collections::HashSet;
impl Solution {
    #[must_use]
    pub fn remove_invalid_parentheses(s: String) -> Vec<String> {
        let s = s.into_bytes();
        let n = s.len();
        let mut balance = vec![0; n + 1];
        for i in 0..n {
            balance[i + 1] = match s[i] {
                b'(' => balance[i] + 1,
                b')' => balance[i] - 1,
                _ => balance[i],
            };
        }
        let min_balance = balance.iter().copied().min().unwrap();
        let final_balance = balance[n];
        let opt = (final_balance - 2 * min_balance) as usize;
        let mut answers = HashSet::new();
        let mut buf = Vec::with_capacity(s.len() - opt as usize);
        Self::backtrack(&s, 0, opt, &mut buf, &mut answers);
        answers
            .into_iter()
            .map(|v| String::from_utf8(v).unwrap())
            .collect()
    }
    fn backtrack(
        s: &[u8],
        current_balance: i32,
        left_to_remove: usize,
        buf: &mut Vec<u8>,
        answers: &mut HashSet<Vec<u8>>,
    ) {
        if current_balance < 0
            || left_to_remove > s.len()
            || current_balance.unsigned_abs() as usize > s.len()
        {
            return;
        }
        let Some(c) = s.first().copied() else {
            answers.insert(buf.clone());
            return;
        };
        if c != b'(' && c != b')' {
            buf.push(c);
            Self::backtrack(&s[1..], current_balance, left_to_remove, buf, answers);
            buf.pop();
            return;
        }
        let balance_after = if c == b'(' {
            current_balance + 1
        } else {
            current_balance - 1
        };
        buf.push(c);
        Self::backtrack(&s[1..], balance_after, left_to_remove, buf, answers);
        buf.pop();
        if left_to_remove > 0 {
            Self::backtrack(&s[1..], current_balance, left_to_remove - 1, buf, answers);
        }
    }
}