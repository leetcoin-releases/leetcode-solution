object Solution {
    def reverse(x: Int): Int = {
        var n = x
        var rev = 0
        while (n != 0) {
            val pop = n % 10
            n /= 10
            if (rev > Int.MaxValue / 10 || (rev == Int.MaxValue / 10 && pop > 7)) return 0
            if (rev < Int.MinValue / 10 || (rev == Int.MinValue / 10 && pop < -8)) return 0
            rev = rev * 10 + pop
        }
        rev
    }
}
