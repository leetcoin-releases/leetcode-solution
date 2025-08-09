/**
 * @param {string} s
 * @return {string[]}
 */
const removeInvalidParentheses = function (s) {
    const res = new Set()
    let leftRemoved = 0, rightRemoved = 0
    for (let ch of s) {
        if (ch === '(') {
            leftRemoved++
        }
        if (ch === ')') {
            if (leftRemoved > 0) {
                leftRemoved--
            } else {
                rightRemoved++
            }
        }
    }
    const bt = (idx, path, lCount, lRem, rRem) => {
        if (idx === s.length) {
            if (lRem === 0 && rRem === 0 && lCount === 0) {
                res.add(path)
            }
            return
        }
        const ch = s[idx]
        if (ch === '(' && lRem > 0) {
            if (idx === 0 || s[idx] !== s[idx - 1] || path[path.length - 1] !== s[idx]) {
                bt(idx + 1, path, lCount, lRem - 1, rRem)
            }
        }
        if (ch === ')' && rRem > 0) {
            if (idx === 0 || s[idx] !== s[idx - 1] || path[path.length - 1] !== s[idx]) {
                bt(idx + 1, path, lCount, lRem, rRem - 1)
            }
        }
        if (ch !== '(' && ch !== ')') {
            bt(idx + 1, path + ch, lCount, lRem, rRem)
        } else if (ch === '(') {
            bt(idx + 1, path + ch, lCount + 1, lRem, rRem)
        } else if (ch === ')' && lCount > 0) {
            bt(idx + 1, path + ch, lCount - 1, lRem, rRem)
        }

    }
    bt(0, "", 0, leftRemoved, rightRemoved)
    return Array.from(res)
};