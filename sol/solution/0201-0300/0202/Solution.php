class Solution {
    /**
     * @param Integer $n
     * @return Boolean
     */
    function isHappy($n) {
        $getNext = function($num) {
            $sum = 0;
            while ($num > 0) {
                $d = $num % 10;
                $sum += $d * $d;
                $num = intdiv($num, 10);
            }
            return $sum;
        };
        $slow = $n;
        $fast = $getNext($n);
        while ($fast != 1 && $slow != $fast) {
            $slow = $getNext($slow);
            $fast = $getNext($getNext($fast));
        }
        return $fast == 1;
    }
}
