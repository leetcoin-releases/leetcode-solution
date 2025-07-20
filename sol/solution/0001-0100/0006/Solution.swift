class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || s.count <= numRows { return s }
        var rows = Array(repeating: "", count: min(numRows, s.count))
        var curRow = 0
        var goingDown = false
        for c in s {
            rows[curRow] += String(c)
            if curRow == 0 || curRow == numRows - 1 { goingDown.toggle() }
            curRow += goingDown ? 1 : -1
        }
        return rows.joined()
    }
}