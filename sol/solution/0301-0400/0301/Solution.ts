function removeInvalidParentheses(s: string): string[] {
    const res: string[] = []
    const dfs = (str: string, idx: number, l: number, r: number) => {
        if (l === 0 && r === 0) {
            if (isValid(str)) res.push(str)
            return
        }
        for (let i = idx; i < str.length; i++) {
            if (i !== idx && str[i] == str[i - 1]) continue
            if (str[i] === '(' || str[i] === ')') {
                const curr = str.substring(0, i) + str.substring(i + 1)
                if (r > 0 && str[i] === ')') {
                    dfs(curr, i, l, r - 1)
                } else if (l > 0 && str[i] === '(') {
                    dfs(curr, i, l - 1, r)
                }
            }
        }
    }
    let l = 0
    let r = 0
    for (const letter of s) {
        if (letter === '(') {
            l += 1
        }
        if (l === 0) {
            r += letter === ')' ? 1 : 0
        } else {
            l -= letter === ')' ? 1 : 0
        }
    }
    dfs(s, 0, l, r)
    return res
};
const isValid = (str: string) => {
    let count = 0
    for (const letter of str) {
        if (letter === '(') count += 1
        if (letter === ')') count -= 1
        if (count < 0) return false
    }
    return count === 0
}