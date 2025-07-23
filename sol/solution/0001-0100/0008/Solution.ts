function myAtoi(s: string): number {
    let i = 0, sign = 1, result = 0;
    while (s[i] === ' ') i++;
    if (s[i] === '+' || s[i] === '-') sign = s[i++] === '-' ? -1 : 1;
    while (s[i] >= '0' && s[i] <= '9') {
        let digit = parseInt(s[i++]);
        if (result > (2**31 - 1 - digit) / 10)
            return sign === 1 ? 2**31 - 1 : -(2**31);
        result = result * 10 + digit;
    }
    return result * sign;
}
