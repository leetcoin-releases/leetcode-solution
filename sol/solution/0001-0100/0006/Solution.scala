object Solution {
    def convert(s: String, numRows: Int): String = {
        if (numRows == 1 || s.length <= numRows) return s
        val rows = Array.fill(Math.min(numRows, s.length))("")
        var curRow = 0
        var goingDown = false
        for (c <- s) {
            rows(curRow) += c
            if (curRow == 0 || curRow == numRows - 1) goingDown = !goingDown
            curRow += (if (goingDown) 1 else -1)
        }
        rows.mkString("")
    }
}