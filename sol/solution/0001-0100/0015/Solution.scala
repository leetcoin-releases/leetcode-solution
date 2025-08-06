object Solution {
    def threeSum(nums: Array[Int]): List[List[Int]] = {
        val sorted = nums.sorted
        var res = List[List[Int]]()
        for (i <- 0 until sorted.length - 2) {
            if (i == 0 || sorted(i) != sorted(i - 1)) {
                var l = i + 1
                var r = sorted.length - 1
                while (l < r) {
                    val sum = sorted(i) + sorted(l) + sorted(r)
                    if (sum < 0) l += 1
                    else if (sum > 0) r -= 1
                    else {
                        res ::= List(sorted(i), sorted(l), sorted(r))
                        while (l < r && sorted(l) == sorted(l + 1)) l += 1
                        while (l < r && sorted(r) == sorted(r - 1)) r -= 1
                        l += 1
                        r -= 1
                    }
                }
            }
        }
        res
    }
}
