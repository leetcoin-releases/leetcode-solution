class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        val last = mutableMapOf<Char, Int>()
        var res = 0; var start = 0
        for ((i, c) in s.withIndex()) {
            start = maxOf(start, (last[c]?.plus(1)) ?: start)
            res = maxOf(res, i - start + 1)
            last[c] = i
        }
        return res
    }
}
