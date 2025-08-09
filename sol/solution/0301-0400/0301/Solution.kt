class Solution {
    fun removeInvalidParentheses(s: String): List<String> {
        val res = mutableListOf<String>()
        dfs(s, 0, 0, res, false)
        return res
    }
    private fun dfs(
        s: String,
        deletionSearch: Int,
        stackSearch: Int,
        res: MutableList<String>,
        ri: Boolean
    ) {
        var stack = 0
        var p = stackSearch
        while (p < s.length && stack >= 0) {
            when (s[p]) {
                '(' -> stack++
                ')' -> stack--
            }
            p++
        }
        if (stack < 0) {
            val prefix = s.substring(0, p)
            var i = deletionSearch
            while (i < prefix.length) {
                if (s[i] == ')' && (i == deletionSearch || s[i - 1] != ')')) {
                    dfs(s.removeRange(i, i + 1), i, p - 1, res, ri)
                }
                i++
            }
        } else {
            if (!ri) {
                dfs(reverseInvert(s), 0, 0, res, true)
            } else {
                res.add(reverseInvert(s))
            }
        }
    }
    private fun reverseInvert(s: String): String {
        val sb = StringBuilder()
        for (c in s) {
            when (c) {
                '(' -> sb.append(')')
                ')' -> sb.append('(')
                else -> sb.append(c)
            }
        }
        return sb.reverse().toString()
    }
}