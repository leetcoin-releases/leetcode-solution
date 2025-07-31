class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        let m = s.count, n = p.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        for j in stride(from: 2, through: n, by: 2) {
            if p[j-1] == "*" && dp[0][j-2] { dp[0][j] = true }
        }
        for i in 1...m {
            for j in 1...n {
                if p[j-1] == "*" {
                    dp[i][j] = dp[i][j-2] || (dp[i-1][j] && (s[i-1] == p[j-2] || p[j-2] == "."))
                } else {
                    dp[i][j] = dp[i-1][j-1] && (s[i-1] == p[j-1] || p[j-1] == ".")
                }
            }
        }
        return dp[m][n]
    }
}