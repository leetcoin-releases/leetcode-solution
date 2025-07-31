class Solution {
    /**
     * @param String $s
     * @return String
     */
    function longestPalindrome($s) {
        $n = strlen($s);
        $start = 0;
        $maxLen = 1;
        for ($i = 0; $i < $n; $i++) {
            $left = $right = $i;
            while ($left >= 0 && $right < $n && $s[$left] == $s[$right]) {
                if ($right - $left + 1 > $maxLen) {
                    $start = $left;
                    $maxLen = $right - $left + 1;
                }
                $left--;
                $right++;
            }
            $left = $i;
            $right = $i + 1;
            while ($left >= 0 && $right < $n && $s[$left] == $s[$right]) {
                if ($right - $left + 1 > $maxLen) {
                    $start = $left;
                    $maxLen = $right - $left + 1;
                }
                $left--;
                $right++;
            }
        }
        
        return substr($s, $start, $maxLen);
    }
}