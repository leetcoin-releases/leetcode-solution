class Solution {
    /**
     * @param Integer $left
     * @param Integer $right
     * @return Integer
     */
     function rangeBitwiseAnd($left, $right) {
        while ($left < $right) {
            $right &= ($right - 1);
        }
        return $right;
    }
}