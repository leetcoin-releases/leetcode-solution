object Solution {
    def longestPalindrome(s: String): String = {
        val n = s.length
        var start = 0
        var maxLen = 1
        for (i <- 0 until n) {
            var left = i
            var right = i
            while (left >= 0 && right < n && s(left) == s(right)) {
                if (right - left + 1 > maxLen) {
                    start = left
                    maxLen = right - left + 1
                }
                left -= 1
                right += 1
            }
            left = i
            right = i + 1
            while (left >= 0 && right < n && s(left) == s(right)) {
                if (right - left + 1 > maxLen) {
                    start = left
                    maxLen = right - left + 1
                }
                left -= 1
                right += 1
            }
        }
        s.substring(start, start + maxLen)
    }
}