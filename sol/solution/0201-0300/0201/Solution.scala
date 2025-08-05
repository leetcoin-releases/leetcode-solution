object Solution {
    def rangeBitwiseAnd(left: Int, right: Int): Int = {
        var l = left
        var r = right
        while (l < r) {
            r &= (r - 1)
        }
        r
    }
}