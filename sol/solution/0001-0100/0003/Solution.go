func lengthOfLongestSubstring(s string) int {
    last := make(map[rune]int)
    res, start := 0, 0
    for i, c := range s {
        if idx, ok := last[c]; ok && idx >= start {
            start = idx + 1
        }
        if i - start + 1 > res {
            res = i - start + 1
        }
        last[c] = i
    }
    return res
}
