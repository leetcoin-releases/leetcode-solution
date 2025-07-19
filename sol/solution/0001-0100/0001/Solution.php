class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    function twoSum($nums, $target) {
        $d = [];
        foreach ($nums as $i => $x) {
            if (isset($d[$target - $x])) {
                return [$d[$target - $x], $i];
            }
            $d[$x] = $i;
        }
    }
}