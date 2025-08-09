class NumMatrix(matrix: Array<IntArray>) {
    private val prefixMatrix: Array<IntArray>
    init {
        val matrixRowsCount = matrix.size + 1
        val matrixColsCount = matrix[0].size + 1
        prefixMatrix = Array(matrixRowsCount, init = { IntArray(matrixColsCount)})
        for (row in 1 until matrixRowsCount) {
            for (i in 1 until matrixColsCount) {
                prefixMatrix[row][i] = matrix[row - 1][i - 1] + prefixMatrix[row][i - 1] + prefixMatrix[row - 1][i] - prefixMatrix[row - 1][i - 1]
            }
        }
    }
    fun sumRegion(row1: Int, col1: Int, row2: Int, col2: Int): Int {
        return prefixMatrix[row2 + 1][col2 + 1] - prefixMatrix[row2 + 1][col1] - prefixMatrix[row1][col2 + 1] + prefixMatrix[row1][col1]
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * var obj = NumMatrix(matrix)
 * var param_1 = obj.sumRegion(row1,col1,row2,col2)
 */