class Solution {
    /**
     * @param Integer $x
     * @return Boolean
     */
    public function isPalindrome($x) {
        if ($x < 0 || ($x % 10 == 0 && $x != 0)) return false;
        $reversed = 0;
        while ($x > $reversed) {
            $reversed = $reversed * 10 + $x % 10;
            $x = intdiv($x, 10);
        }
        return $x == $reversed || $x == intdiv($reversed, 10);
    }
}