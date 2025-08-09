class NumMatrix {
    private var prefixSumMatrix: [[Int]]
    init(_ matrix: [[Int]]) {
        if matrix.isEmpty {
            self.prefixSumMatrix = []
            return
        }
        let numOfRows = matrix.count
        let numOfColums = matrix[0].count
        var result = [Array(repeating: 0, count: numOfColums + 1)]
        for i in 0 ..< numOfRows {
            result.append([0])
            for j in 0 ..< numOfColums {
                let sum = matrix[i][j] 
                + result[i][j + 1] 
                + result[i + 1][j]
                - result[i][j]
                result[i + 1].append(sum)
            }
        }
        self.prefixSumMatrix = result
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return prefixSumMatrix[row2 + 1][col2 + 1]
         - prefixSumMatrix[row2 + 1][col1]
         - prefixSumMatrix[row1][col2 + 1]
         + prefixSumMatrix[row1][col1]
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */