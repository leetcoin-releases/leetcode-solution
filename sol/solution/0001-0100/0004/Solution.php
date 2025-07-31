class Solution {
    /**
     * @param Integer[] $nums1
     * @param Integer[] $nums2
     * @return Float
     */
    function findMedianSortedArrays($nums1, $nums2) {
        $m = count($nums1);
        $n = count($nums2);
        if ($m > $n) {
            return $this->findMedianSortedArrays($nums2, $nums1);
        }
        $imin = 0;
        $imax = $m;
        $halfLen = intval(($m + $n + 1) / 2);
        while ($imin <= $imax) {
            $i = intval(($imin + $imax) / 2);
            $j = $halfLen - $i;
            if ($i < $m && $nums2[$j - 1] > $nums1[$i]) {
                $imin = $i + 1;
            } elseif ($i > 0 && $nums1[$i - 1] > $nums2[$j]) {
                $imax = $i - 1;
            } else {
                if ($i == 0) {
                    $maxLeft = $nums2[$j - 1];
                } elseif ($j == 0) {
                    $maxLeft = $nums1[$i - 1];
                } else {
                    $maxLeft = max($nums1[$i - 1], $nums2[$j - 1]);
                }
                if (($m + $n) % 2 == 1) {
                    return $maxLeft;
                }
                if ($i == $m) {
                    $minRight = $nums2[$j];
                } elseif ($j == $n) {
                    $minRight = $nums1[$i];
                } else {
                    $minRight = min($nums1[$i], $nums2[$j]);
                }
                return ($maxLeft + $minRight) / 2.0;
            }
        }
        return 0.0;
    }
}
