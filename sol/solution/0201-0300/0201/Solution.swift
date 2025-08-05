class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var l = left, r = right
        while l < r {
            r &= (r - 1)
        }
        return r
    }
}