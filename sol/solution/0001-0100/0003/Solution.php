class Solution {
    /**
     * @param String $s
     * @return Integer
     */
    function lengthOfLongestSubstring($s) {
        $last = [];
        $res = $start = 0;
        $chars = str_split($s);
        foreach ($chars as $i => $c) {
            if (isset($last[$c]) && $last[$c] >= $start) {
                $start = $last[$c] + 1;
            }
            $res = max($res, $i - $start + 1);
            $last[$c] = $i;
        }
        return $res;
    }
}
