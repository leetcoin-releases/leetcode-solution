class NumMatrix(_matrix: Array[Array[Int]]) {
    private val m = _matrix.length
    private val n = if (m == 0) 0 else _matrix(0).length
    private val prefixSum = Array.ofDim[Int](m + 1, n + 1)
    for (i <- 0 until m; j <- 0 until n) {
        prefixSum(i + 1)(j + 1) = _matrix(i)(j) + prefixSum(i)(j + 1) + prefixSum(i + 1)(j) - prefixSum(i)(j)
    }
    def sumRegion(row1: Int, col1: Int, row2: Int, col2: Int): Int = {
        prefixSum(row2 + 1)(col2 + 1) - prefixSum(row1)(col2 + 1) - prefixSum(row2 + 1)(col1) + prefixSum(row1)(col1)
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * val obj = new NumMatrix(matrix)
 * val param_1 = obj.sumRegion(row1,col1,row2,col2)
 */