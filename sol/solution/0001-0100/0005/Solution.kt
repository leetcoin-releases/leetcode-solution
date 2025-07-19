class Solution {
    fun longestPalindrome(s: String): String {
        val n = s.length
        var start = 0
        var maxLen = 1
        for (i in 0 until n) {
            var left = i
            var right = i
            while (left >= 0 && right < n && s[left] == s[right]) {
                if (right - left + 1 > maxLen) {
                    start = left
                    maxLen = right - left + 1
                }
                left--
                right++
            }
            left = i
            right = i + 1
            while (left >= 0 && right < n && s[left] == s[right]) {
                if (right - left + 1 > maxLen) {
                    start = left
                    maxLen = right - left + 1
                }
                left--
                right++
            }
        }
        return s.substring(start, start + maxLen)
    }
}