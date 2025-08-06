class Solution {
    func intToRoman(_ num: Int) -> String {
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var num = num
        var result = ""
        for (i, value) in values.enumerated() {
            while num >= value {
                result += symbols[i]
                num -= value
            }
        }
        return result
    }
}
