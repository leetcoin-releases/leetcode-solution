class Solution {
    func myAtoi(_ s: String) -> Int {
        let chars = Array(s)
        var i = 0, sign = 1, result = 0
        while i < chars.count && chars[i] == " " { i += 1 }
        if i < chars.count && (chars[i] == "+" || chars[i] == "-") {
            sign = chars[i] == "-" ? -1 : 1
            i += 1
        }
        while i < chars.count && chars[i].isNumber {
            let digit = Int(String(chars[i]))!
            if result > (Int(Int32.max) - digit) / 10 {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            result = result * 10 + digit
            i += 1
        }
        return result * sign
    }
}
