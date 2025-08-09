public class NumMatrix {
    private readonly int[][] _sums;
    public NumMatrix(int[][] matrix) {
        var rows  = matrix.Length;
        var cols  = matrix[0].Length;
        _sums = new int[rows + 1][];
        _sums[0] = new int[cols + 1];
        for (var x = 1; x <= rows; x++)
        {
            var rowValues = matrix[x - 1];
            var rowSumsCurrent = new int[cols + 1];
            var rowSumsPrev = _sums[x - 1];
            _sums[x] = rowSumsCurrent;
            for (var y = 1; y <= cols; y++)
            {
                rowSumsCurrent[y] = rowValues[y - 1] +
                    rowSumsPrev[y] +
                    rowSumsCurrent[y - 1] -
                    rowSumsPrev[y - 1];
            }
        }
    }
    public int SumRegion(int row1, int col1, int row2, int col2) {
        var result = _sums[row2 + 1][col2 + 1] -
            _sums[row1][col2 + 1] -
            _sums[row2 + 1][col1] + 
            _sums[row1][col1];
        return result;
    }
}
/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix obj = new NumMatrix(matrix);
 * int param_1 = obj.SumRegion(row1,col1,row2,col2);
 */