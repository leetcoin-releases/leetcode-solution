class Solution {
  String longestPalindrome(String s) {
    String ans = "";
    int i = 0;
    while (i < s.length) {
      int j = i;
      while (j + 1 < s.length && s[j + 1] == s[i]) {
        j++;
      }
      int k = 1;
      while (i - k >= 0 && j + k < s.length && s[i - k] == s[j + k]) {
        k++;
      }
      final l = i - (k - 1);
      final r = j + (k - 1) + 1;
      if (r - l > ans.length) {
        ans = s.substring(l, r);
      }
      if (ans.length == s.length) {
        break;
      }
      i++;
    }
    return ans;
  }
}