object Solution {
  def isMatch(s: String, p: String): Boolean = {
    val m = s.length
    val n = p.length
    val dp = Array.ofDim[Boolean](m + 1, n + 1)
    dp(0)(0) = true
    for (j <- 2 to n by 2 if p(j - 1) == '*' && dp(0)(j - 2)) {
      dp(0)(j) = true
    }
    for (i <- 1 to m; j <- 1 to n) {
      if (p(j - 1) == '*') {
        dp(i)(j) = dp(i)(j - 2) || (dp(i - 1)(j) && (s(i - 1) == p(j - 2) || p(j - 2) == '.'))
      } else {
        dp(i)(j) = dp(i - 1)(j - 1) && (s(i - 1) == p(j - 1) || p(j - 1) == '.')
      }
    }
    dp(m)(n)
  }
}