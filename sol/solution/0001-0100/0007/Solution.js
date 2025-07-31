/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {
    let rev = 0;
    while (x !== 0) {
        let pop = x % 10;
        x = (x / 10) | 0;
        if (rev > 214748364 || (rev === 214748364 && pop > 7)) return 0;
        if (rev < -214748364 || (rev === -214748364 && pop < -8)) return 0;
        rev = rev * 10 + pop;
    }
    return rev;
};
