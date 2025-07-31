class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var last = [Character: Int]()
        var res = 0, start = 0
        for (i, c) in s.enumerated() {
            if let idx = last[c], idx >= start {
                start = idx + 1
            }
            res = max(res, i - start + 1)
            last[c] = i
        }
        return res
    }
}
