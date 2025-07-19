class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_map<char, int> last; 
        int res = 0, start = 0;
        for(int i = 0; i < int(s.size()); ++i) {
            if (last.count(s[i]))
                start = max(start, last[s[i]]);
            res = max(res, i - start + 1);
            last[s[i]] = i + 1;
        }
        return res;
    }
};
