class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1 || s.length <= numRows) return s;
    List<StringBuffer> rows = List.generate(numRows, (_) => StringBuffer());
    int curRow = 0;
    bool goingDown = false;
    for (var c in s.split('')) {
      rows[curRow].write(c);
      if (curRow == 0 || curRow == numRows - 1) goingDown = !goingDown;
      curRow += goingDown ? 1 : -1;
    }
    return rows.map((sb) => sb.toString()).join('');
  }
}