object Solution {
    def intToRoman(num: Int): String = {
        val values = List(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
        val symbols = List("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")
        var n = num
        val sb = new StringBuilder
        for (i <- values.indices) {
            while (n >= values(i)) {
                sb.append(symbols(i))
                n -= values(i)
            }
        }
        sb.toString
    }
}
