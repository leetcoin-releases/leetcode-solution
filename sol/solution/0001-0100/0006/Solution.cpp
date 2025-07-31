class Solution {
public:
    string convert(string s, int numRows) {
        if (numRows == 1 || s.length() <= numRows) return s;
        vector<string> rows(min(numRows, int(s.size())));
        int curRow = 0, dir = -1;
        for (char c : s) {
            rows[curRow] += c;
            if (curRow == 0 || curRow == numRows - 1) dir *= -1;
            curRow += dir;
        }
        string ret;
        for (string row : rows) ret += row;
        return ret;
    }
};