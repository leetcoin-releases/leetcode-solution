func ReverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
func helper(s string, left int, right int, res *[]string, pars []rune) {
    stack := 0
    n := len(s)
    for ; right < n; right++ {
        if rune(s[right]) == pars[0] {
            stack++
        } else if rune(s[right]) == pars[1] {
            stack--
        }
        if stack < 0 {
            break
        }
    }
    if stack < 0 {
        for ; left <= right; left++ {
            c := rune(s[left])
            if c != pars[1] {
                continue
            }
            if left > 1 && s[left] == s[left-1] {
                continue
            }
            helper(s[0:left]+s[left+1:], left, right, res, pars)
        }
    } else if stack > 0 {
        helper(ReverseString(s), 0, 0, res, []rune{')', '('})
    } else {
        if pars[0] == '(' {
            fmt.Print("simple", res, s)
            *res = append(*res, s)
        } else {
            newS := ReverseString(s)
            fmt.Print("reverse ", res, newS)
            *res = append(*res, newS)
        }
    }
}
func removeInvalidParentheses(s string) []string {
    res := make([]string, 0, 0)
    helper(s, 0, 0, &res, []rune{'(', ')'})
    return res
}
