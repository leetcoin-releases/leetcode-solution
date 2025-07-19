public class Solution {
    public int LengthOfLongestSubstring(string s) {
        var map = new Dictionary<char, int>();
        int res = 0, start = 0;
        for(int i = 0; i < s.Length; ++i) {
            if(map.TryGetValue(s[i], out int idx) && idx >= start)
                start = idx + 1;
            res = Math.Max(res, i - start + 1);
            map[s[i]] = i;
        }
        return res;
    }
}
