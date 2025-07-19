char* longestPalindrome(char* s) {
    if (strlen(s) < 2) return strdup(s);
    int start = 0, maxLen = 1;
    for (int i = 0; i < strlen(s); ++i) {
        int l = i, r = i;
        while (l >= 0 && r < strlen(s) && s[l] == s[r]) {
            if (r - l + 1 > maxLen) {
                start = l;
                maxLen = r - l + 1;
            }
            l--; r++;
        }
        l = i, r = i + 1;
        while (l >= 0 && r < strlen(s) && s[l] == s[r]) {
            if (r - l + 1 > maxLen) {
                start = l;
                maxLen = r - l + 1;
            }
            l--; r++;
        }
    }
    char* res = (char*)malloc(maxLen + 1);
    strncpy(res, s + start, maxLen);
    res[maxLen] = '\0';
    return res;
}