class Solution {
    fun rangeBitwiseAnd(left: Int, right: Int): Int {
        var l = left
        var r = right
        while (l < r) {
            r = r and (r - 1)
        }
        return r
    }
}