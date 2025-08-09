type NumMatrix struct {
    matrix [][]int
    prefixSum [][]int
}
func Constructor(matrix [][]int) NumMatrix {
    rowLength := len(matrix)
    colLength := len(matrix[0])
    prefixSum := make([][]int, rowLength+1)
    for i := 0; i <= rowLength; i++ {
        prefixSum[i] = make([]int, colLength+1)
    }
    for i := 1; i <= rowLength; i++ {
        for j := 1; j <= colLength; j++ {
            prefixSum[i][j] = matrix[i-1][j-1] + prefixSum[i-1][j] + prefixSum[i][j-1] - prefixSum[i-1][j-1]
        }
    }
    return NumMatrix{matrix: matrix, prefixSum:prefixSum}
}
func (this *NumMatrix) SumRegion(row1 int, col1 int, row2 int, col2 int) int {
    r1, c1, r2, c2 := row1+1, col1+1, row2+1, col2+1
    return this.prefixSum[r2][c2] - this.prefixSum[r1-1][c2] - this.prefixSum[r2][c1-1] + this.prefixSum[r1-1][c1-1]
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * obj := Constructor(matrix);
 * param_1 := obj.SumRegion(row1,col1,row2,col2);
 */