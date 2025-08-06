func romanToInt(s string) int {
    val := map[byte]int{'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    res := 0
    for i := 0; i < len(s); i++ {
        if i+1 < len(s) && val[s[i]] < val[s[i+1]] {
            res -= val[s[i]]
        } else {
            res += val[s[i]]
        }
    }
    return res
}
