/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
    const val = {'I':1, 'V':5, 'X':10, 'L':50, 'C':100, 'D':500, 'M':1000};
    let res = 0;
    for (let i = 0; i < s.length; i++) {
        if (i+1 < s.length && val[s[i]] < val[s[i+1]])
            res -= val[s[i]];
        else
            res += val[s[i]];
    }
    return res;
};
