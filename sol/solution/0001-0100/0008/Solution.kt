class Solution {
    fun myAtoi(s: String): Int {
        var i = 0
        val n = s.length
        var sign = 1
        var result = 0
        while (i < n && s[i] == ' ') i++
        if (i < n && (s[i] == '+' || s[i] == '-')) {
            sign = if (s[i] == '-') -1 else 1
            i++
        }
        while (i < n && s[i].isDigit()) {
            val digit = s[i] - '0'
            if (result > (Int.MAX_VALUE - digit) / 10)
                return if (sign == 1) Int.MAX_VALUE else Int.MIN_VALUE
            result = result * 10 + digit
            i++
        }
        return result * sign
    }
}
