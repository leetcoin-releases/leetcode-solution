class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var prefix = strs[0]
        for str in strs[1...] {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast())
                if prefix.isEmpty { return "" }
            }
        }
        return prefix
    }
}