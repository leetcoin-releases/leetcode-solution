class Solution {
  int romanToInt(String s) {
    final val = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};
    int res = 0;
    for (int i = 0; i < s.length; i++) {
      int curr = val[s[i]]!;
      int next = i + 1 < s.length ? val[s[i + 1]]! : 0;
      res += (curr < next) ? -curr : curr;
    }
    return res;
  }
}
