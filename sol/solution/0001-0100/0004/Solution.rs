impl Solution {
    pub fn find_median_sorted_arrays(nums1: Vec<i32>, nums2: Vec<i32>) -> f64 {
        let (mut a, mut b) = (nums1, nums2);
        if a.len() > b.len() {
            std::mem::swap(&mut a, &mut b);
        }
        let (m, n) = (a.len(), b.len());
        let mut imin = 0;
        let mut imax = m;
        let half_len = (m + n + 1) / 2;
        while imin <= imax {
            let i = (imin + imax) / 2;
            let j = half_len - i;
            if i < m && b[j - 1] > a[i] {
                imin = i + 1;
            } else if i > 0 && a[i - 1] > b[j] {
                imax = i - 1;
            } else {
                let max_of_left = if i == 0 {
                    b[j - 1]
                } else if j == 0 {
                    a[i - 1]
                } else {
                    a[i - 1].max(b[j - 1])
                };
                if (m + n) % 2 == 1 {
                    return max_of_left as f64;
                }
                let min_of_right = if i == m {
                    b[j]
                } else if j == n {
                    a[i]
                } else {
                    a[i].min(b[j])
                };
                return (max_of_left as f64 + min_of_right as f64) / 2.0;
            }
        }
        0.0
    }
}
