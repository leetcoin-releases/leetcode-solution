class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var rev = 0
        while x != 0 {
            let pop = x % 10
            x /= 10
            if rev > Int32.max/10 || (rev == Int32.max/10 && pop > 7) { return 0 }
            if rev < Int32.min/10 || (rev == Int32.min/10 && pop < -8) { return 0 }
            rev = rev * 10 + pop
        }
        return rev
    }
}
