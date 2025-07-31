function longestPalindrome(s: string): string {
    const n: number = s.length;
    let start: number = 0, maxLen: number = 1;   
    for (let i = 0; i < n; i++) {
        let left: number = i, right: number = i;
        while (left >= 0 && right < n && s[left] === s[right]) {
            if (right - left + 1 > maxLen) {
                start = left;
                maxLen = right - left + 1;
            }
            left--;
            right++;
        }
        left = i;
        right = i + 1;
        while (left >= 0 && right < n && s[left] === s[right]) {
            if (right - left + 1 > maxLen) {
                start = left;
                maxLen = right - left + 1;
            }
            left--;
            right++;
        }
    }
    return s.substring(start, start + maxLen);
}