class Solution {
    /**
     * @param String $s
     * @return Integer
     */
    function myAtoi($s) {
        $s = ltrim($s); 
        $n = strlen($s);
        $i = 0;
        $sign = 1;
        $result = 0;
        if ($i < $n && ($s[$i] === '-' || $s[$i] === '+')) {
            $sign = ($s[$i] === '-') ? -1 : 1;
            $i++;
        }
        while ($i < $n && ctype_digit($s[$i])) {
            $digit = intval($s[$i]);
            if ($result > (2147483647 - $digit) / 10) {
                return $sign === 1 ? 2147483647 : -2147483648;
            }
            $result = $result * 10 + $digit;
            $i++;
        }
        return $sign * $result;
    }
}
