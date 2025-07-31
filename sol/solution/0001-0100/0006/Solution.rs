impl Solution {
    pub fn convert(s: String, num_rows: i32) -> String {
        if num_rows == 1 || s.len() <= num_rows as usize {
            return s;
        }
        let mut rows = vec![String::new(); num_rows as usize];
        let mut cur_row = 0;
        let mut down = false;
        for c in s.chars() {
            rows[cur_row].push(c);
            if cur_row == 0 || cur_row == (num_rows - 1) as usize {
                down = !down;
            }
            cur_row = if down { cur_row + 1 } else { cur_row - 1 };
        }
        rows.concat()
    }
}