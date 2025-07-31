object Solution {
    def myAtoi(s: String): Int = {
        var i = 0
        var sign = 1
        var result = 0
        val n = s.length
        while (i < n && s(i) == ' ') i += 1
        if (i < n && (s(i) == '+' || s(i) == '-')) {
            sign = if (s(i) == '-') -1 else 1
            i += 1
        }
        while (i < n && s(i).isDigit) {
            val digit = s(i) - '0'
            if (result > (Int.MaxValue - digit) / 10)
                return if (sign == 1) Int.MaxValue else Int.MinValue
            result = result * 10 + digit
            i += 1
        }
        result * sign
    }
}
