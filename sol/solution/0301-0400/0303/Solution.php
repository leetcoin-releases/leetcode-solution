class NumArray {
    /**
     * @param Integer[] $nums
     */
    private $prefixSum;
    function __construct($nums) {
        $this->prefixSum = [];
        $sum = 0;
        foreach ($nums as $num) {
            $sum += $num;
            $this->prefixSum[] = $sum;
        }
    }
    /**
     * @param Integer $left
     * @param Integer $right
     * @return Integer
     */
    function sumRange($left, $right) {
        if ($left == 0) {
            return $this->prefixSum[$right];
        }
        return $this->prefixSum[$right] - $this->prefixSum[$left - 1];
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * $obj = NumArray($nums);
 * $ret_1 = $obj->sumRange($left, $right);
 */