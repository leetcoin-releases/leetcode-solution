class Solution {
    /**
     * @param Integer[] $nums
     * @return Integer[][]
     */
    function threeSum($nums) {
        sort($nums);
        $res = [];
        $n = count($nums);
        for ($i = 0; $i < $n - 2; $i++) {
            if ($i > 0 && $nums[$i] == $nums[$i - 1]) continue;
            $l = $i + 1;
            $r = $n - 1;
            while ($l < $r) {
                $sum = $nums[$i] + $nums[$l] + $nums[$r];
                if ($sum < 0) $l++;
                else if ($sum > 0) $r--;
                else {
                    $res[] = [$nums[$i], $nums[$l], $nums[$r]];
                    while ($l < $r && $nums[$l] == $nums[$l + 1]) $l++;
                    while ($l < $r && $nums[$r] == $nums[$r - 1]) $r--;
                    $l++; $r--;
                }
            }
        }
        return $res;
    }
}
