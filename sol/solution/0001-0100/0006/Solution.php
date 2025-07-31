class Solution {

    /**
     * @param String $s
     * @param Integer $numRows
     * @return String
     */
    function convert($s, $numRows) {
        if ($numRows == 1 || strlen($s) <= $numRows) {
            return $s;
        }
        $rows = array_fill(0, $numRows, "");
        $curRow = 0;
        $down = false;
        for ($i = 0; $i < strlen($s); $i++) {
            $rows[$curRow] .= $s[$i];
            if ($curRow == 0 || $curRow == $numRows - 1) {
                $down = !$down;
            }
            $curRow += $down ? 1 : -1;
        }
        return implode("", $rows);
    }
}