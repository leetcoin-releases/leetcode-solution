object Solution {
    def removeInvalidParentheses(s: String): List[String] = {
        var rl = 0
        var rr = 0
        for (c <- s) {
            if (c == '(') rl += 1
            else if (c == ')') {
                if (rl > 0) rl -= 1
                else rr += 1
            }
        }
        val ans = scala.collection.mutable.Set[String]()
        def dfs(i: Int, l: Int, r: Int, open: Int, path: StringBuilder): Unit = {
            if (i == s.length) {
                if (l == 0 && r == 0 && open == 0) ans += path.toString
                return
            }
            val c = s(i)
            val len = path.length
            if (c == '(') {
                if (l > 0) dfs(i + 1, l - 1, r, open, path)
                path.append(c)
                dfs(i + 1, l, r, open + 1, path)
                path.setLength(len)
            } else if (c == ')') {
                if (r > 0) dfs(i + 1, l, r - 1, open, path)
                if (open > 0) {
                    path.append(c)
                    dfs(i + 1, l, r, open - 1, path)
                    path.setLength(len)
                }
            } else {
                path.append(c)
                dfs(i + 1, l, r, open, path)
                path.setLength(len)
            }
        }
        dfs(0, rl, rr, 0, new StringBuilder)
        ans.toList
    }
}
