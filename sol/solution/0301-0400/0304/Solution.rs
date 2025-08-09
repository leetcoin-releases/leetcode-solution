struct NumMatrix {
    box_prefix: Vec<Vec<i32>>,
}
/** 
 * `&self` means the method takes an immutable reference.
 * If you need a mutable reference, change it to `&mut self` instead.
 */
impl NumMatrix {
    fn new(matrix: Vec<Vec<i32>>) -> Self {
        let n_rows = matrix.len();
        let n_cols = matrix[0].len();
        let mut box_prefix = vec![vec![0; n_cols + 1]; n_rows + 1];
        for r in 0..matrix.len() {
            let mut row_prefix = 0;
            for c in 0..matrix[0].len() {
                row_prefix += matrix[r][c];
                box_prefix[r + 1][c + 1] = row_prefix + box_prefix[r][c + 1];
            }
        }
        Self { box_prefix }
    }
    fn sum_region(&self, row1: i32, col1: i32, row2: i32, col2: i32) -> i32 {
        let (row1, col1, row2, col2) = (row1 + 1, col1 + 1, row2 + 1, col2 + 1);
        let (row1, col1, row2, col2) = (row1 as usize, col1 as usize, row2 as usize, col2 as usize);
        let bottom_box = self.box_prefix[row2][col2];
        let top_box = self.box_prefix[row1-1][col2];
        let left_box = self.box_prefix[row2][col1-1];
        let twice_subtracted = self.box_prefix[row1 - 1][col1 - 1];
        bottom_box - top_box - left_box + twice_subtracted
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix::new(matrix);
 * let ret_1: i32 = obj.sum_region(row1, col1, row2, col2);
 */