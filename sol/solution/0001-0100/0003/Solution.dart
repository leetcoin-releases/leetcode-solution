class Solution {
  int lengthOfLongestSubstring(String s) {
    final last = <String, int>{};
    int res = 0, start = 0;
    for (int i = 0; i < s.length; i++) {
      final c = s[i];
      if (last.containsKey(c) && last[c]! >= start) {
        start = last[c]! + 1;
      }
      res = (i - start + 1 > res) ? i - start + 1 : res;
      last[c] = i;
    }
    return res;
  }
}
