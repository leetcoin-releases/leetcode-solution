public class Solution {
    public string Convert(string s, int numRows) {
        if (numRows == 1 || s.Length <= numRows) return s;
        var rows = new List<string>(new string[Math.Min(numRows, s.Length)]);
        int curRow = 0;
        bool goingDown = false;
        foreach (char c in s) {
            rows[curRow] += c;
            if (curRow == 0 || curRow == numRows - 1) goingDown = !goingDown;
            curRow += goingDown ? 1 : -1;
        }
        return string.Join("", rows);
    }
}