class Solution(object):
    def convert(self, s, numRows):
        if numRows == 1 or len(s) <= numRows:
            return s
        rows = [''] * min(numRows, len(s))
        cur_row, going_down = 0, False
        for c in s:
            rows[cur_row] += c
            if cur_row == 0 or cur_row == numRows - 1:
                going_down = not going_down
            cur_row += 1 if going_down else -1
        return ''.join(rows)