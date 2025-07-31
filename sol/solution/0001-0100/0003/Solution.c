int lengthOfLongestSubstring(char * s) {
    int last[256], i, res = 0, start = 0;
    for(i = 0; i < 256; ++i) last[i] = -1;
    for(i = 0; s[i]; ++i) {
        if(last[(unsigned char)s[i]] >= start)
            start = last[(unsigned char)s[i]] + 1;
        if(i - start + 1 > res)
            res = i - start + 1;
        last[(unsigned char)s[i]] = i;
    }
    return res;
}
