class NumMatrix
=begin
    :type matrix: Integer[][]
=end
    def initialize(matrix)
        @rows = matrix.length
        @cols = matrix[0]&.length || 0
        @prefix = Array.new(@rows + 1) { Array.new(@cols + 1, 0) }
        (0...@rows).each do |i|
            (0...@cols).each do |j|
                @prefix[i + 1][j + 1] = matrix[i][j] + @prefix[i][j + 1] + @prefix[i + 1][j] - @prefix[i][j]
            end
        end
    end
=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
    def sum_region(row1, col1, row2, col2)
        @prefix[row2 + 1][col2 + 1] - @prefix[row1][col2 + 1] - @prefix[row2 + 1][col1] + @prefix[row1][col1]
    end
end
# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)