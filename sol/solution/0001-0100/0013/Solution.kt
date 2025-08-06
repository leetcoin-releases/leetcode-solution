class Solution {
    fun romanToInt(s: String): Int {
        val valMap = mapOf('I' to 1, 'V' to 5, 'X' to 10, 'L' to 50, 'C' to 100, 'D' to 500, 'M' to 1000)
        var res = 0
        for (i in s.indices) {
            val curr = valMap[s[i]]!!
            val next = if (i + 1 < s.length) valMap[s[i + 1]]!! else 0
            res += if (curr < next) -curr else curr
        }
        return res
    }
}
