class NumMatrix {
    private $sums;
    /**
     * @param Integer[][] $matrix
     */
    function __construct($matrix) {
        $m = count($matrix);
        $n = count($matrix[0]);
        // sums[i][j] is sum of rectangle (0,0) to (i-1,j-1)
        $this->sums = array_fill(0, $m + 1, array_fill(0, $n + 1, 0));
        for ($i = 1; $i <= $m; $i++) {
            for ($j = 1; $j <= $n; $j++) {
                $this->sums[$i][$j] = $matrix[$i - 1][$j - 1]
                    + $this->sums[$i - 1][$j]
                    + $this->sums[$i][$j - 1]
                    - $this->sums[$i - 1][$j - 1];
            }
        }
    }
    /**
     * @param Integer $row1
     * @param Integer $col1
     * @param Integer $row2
     * @param Integer $col2
     * @return Integer
     */
    function sumRegion($row1, $col1, $row2, $col2) {
        // +1 for 1-based indexing in sums
        $r1 = $row1 + 1;
        $c1 = $col1 + 1;
        $r2 = $row2 + 1;
        $c2 = $col2 + 1;
        return $this->sums[$r2][$c2]
            - $this->sums[$r1 - 1][$c2]
            - $this->sums[$r2][$c1 - 1]
            + $this->sums[$r1 - 1][$c1 - 1];
    }
}