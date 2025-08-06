class Solution {
    /**
     * @param String $s
     * @return Integer
     */
    function romanToInt($s) {
        $map = ['I'=>1, 'V'=>5, 'X'=>10, 'L'=>50, 'C'=>100, 'D'=>500, 'M'=>1000];
        $res = 0;
        for ($i = 0; $i < strlen($s); $i++) {
            $val = $map[$s[$i]];
            $next = $i + 1 < strlen($s) ? $map[$s[$i + 1]] : 0;
            $res += ($val < $next) ? -$val : $val;
        }
        return $res;
    }
}
