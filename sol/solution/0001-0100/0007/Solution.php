class Solution {
    /**
     * @param Integer $x
     * @return Integer
     */
    function reverse($x) {
        $isNegative = $x < 0;
    $x = abs($x);
    $rev = (int) strrev((string)$x);
    if ($isNegative) {
        $rev = -$rev;
    }
    if ($rev < -2147483648 || $rev > 2147483647) {
        return 0;
    }
    return $rev;
    }
}