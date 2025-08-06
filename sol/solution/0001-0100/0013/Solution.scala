object Solution {
    def romanToInt(s: String): Int = {
        val map = Map('I' -> 1, 'V' -> 5, 'X' -> 10, 'L' -> 50, 'C' -> 100, 'D' -> 500, 'M' -> 1000)
        s.indices.foldLeft(0) { (res, i) =>
            if (i < s.length - 1 && map(s(i)) < map(s(i + 1))) res - map(s(i))
            else res + map(s(i))
        }
    }
}