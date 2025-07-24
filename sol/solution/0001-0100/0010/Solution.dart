class Solution {
  bool isMatch(String s, String p) {
    int m = s.length, n = p.length;
    var dp = List.generate(m + 1, (_) => List<bool>.filled(n + 1, false));
    dp[0][0] = true;
    for (int j = 2; j <= n; j += 2) {
      if (p[j-1] == '*' && dp[0][j-2]) dp[0][j] = true;
    }
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (p[j-1] == '*') {
          dp[i][j] = dp[i][j-2] || (dp[i-1][j] && (s[i-1] == p[j-2] || p[j-2] == '.'));
        } else {
          dp[i][j] = dp[i-1][j-1] && (s[i-1] == p[j-1] || p[j-1] == '.');
        }
      }
    }
    return dp[m][n];
  }
}