# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  m, n = s.length, p.length
  dp = Array.new(m + 1) { Array.new(n + 1, false) }
  dp[0][0] = true
  (2..n).step(2) { |j| dp[0][j] = true if p[j-1] == '*' && dp[0][j-2] }
  (1..m).each do |i|
    (1..n).each do |j|
      if p[j-1] == '*'
        dp[i][j] = dp[i][j-2] || (dp[i-1][j] && (s[i-1] == p[j-2] || p[j-2] == '.'))
      else
        dp[i][j] = dp[i-1][j-1] && (s[i-1] == p[j-1] || p[j-1] == '.')
      end
    end
  end
  dp[m][n]
end