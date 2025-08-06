class Solution {
    func romanToInt(_ s: String) -> Int {
        let val: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let chars = Array(s)
        var res = 0
        for i in 0..<chars.count {
            if i + 1 < chars.count && val[chars[i]]! < val[chars[i+1]]! {
                res -= val[chars[i]]!
            } else {
                res += val[chars[i]]!
            }
        }
        return res
    }
}
