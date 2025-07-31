object Solution {
    def lengthOfLongestSubstring(s: String): Int = {
        val last = scala.collection.mutable.Map[Char, Int]()
        var res, start = 0
        for ((c, i) <- s.zipWithIndex) {
            if (last.contains(c) && last(c) >= start) 
                start = last(c) + 1
            res = res.max(i - start + 1)
            last(c) = i
        }
        res
    }
}
