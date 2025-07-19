public class Solution {
    public string LongestPalindrome(string s) {
        if (string.IsNullOrEmpty(s)) return "";
        var t = new char[s.Length * 2 + 3];
        t[0] = '^';
        for (int i = 0; i < s.Length; i++) {
            t[2 * i + 1] = '#';
            t[2 * i + 2] = s[i];
        }
        t[t.Length - 2] = '#';
        t[t.Length - 1] = '$';
        int[] p = new int[t.Length];
        int center = 0, right = 0;
        for (int i = 1; i < t.Length - 1; i++) {
            int mirror = 2 * center - i;
            if (i < right)
                p[i] = Math.Min(right - i, p[mirror]);
            while (t[i + (1 + p[i])] == t[i - (1 + p[i])])
                p[i]++;
            if (i + p[i] > right) {
                center = i;
                right = i + p[i];
            }
        }
        int maxLen = 0, centerIndex = 0;
        for (int i = 1; i < t.Length - 1; i++) {
            if (p[i] > maxLen) {
                maxLen = p[i];
                centerIndex = i;
            }
        }
        int start = (centerIndex - maxLen) / 2;
        return s.Substring(start, maxLen);
    }
}