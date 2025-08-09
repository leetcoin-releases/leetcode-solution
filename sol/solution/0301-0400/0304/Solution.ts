class NumMatrix {
    private sumMat: number[][]
    constructor(matrix: number[][]) {
        const rows = matrix.length;
        const cols = matrix[0].length;
        this.sumMat = Array.from({ length: rows + 1 }, () => new Array(cols + 1).fill(0));
        for(let i = 0; i < rows; i++) {
            let prefixSum = 0;
            for(let j = 0; j < cols; j++) {
                prefixSum += matrix[i][j];
                const above = this.sumMat[i][j + 1]
                this.sumMat[i + 1][j + 1] = prefixSum + above;
            }
        }
    }
    sumRegion(row1: number, col1: number, row2: number, col2: number): number {
        row1++; col1++; row2++; col2++;
        const bottomRight = this.sumMat[row2][col2];
        const topRight = this.sumMat[row1 - 1][col2];
        const bottomLeft = this.sumMat[row2][col1 - 1];
        const topLeft = this.sumMat[row1 - 1][col1 - 1];
        return bottomRight - topRight - bottomLeft + topLeft;
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * var obj = new NumMatrix(matrix)
 * var param_1 = obj.sumRegion(row1,col1,row2,col2)
 */