int myAtoi(char* s) {
    int i = 0, sign = 1, result = 0;
    while (s[i] == ' ') i++; 
    if (s[i] == '+' || s[i] == '-') sign = (s[i++] == '-') ? -1 : 1;
    while (s[i] >= '0' && s[i] <= '9') {
        int digit = s[i++] - '0';
        if (result > (INT_MAX - digit) / 10)
            return sign == 1 ? INT_MAX : INT_MIN;
        result = result * 10 + digit;
    }
    return result * sign;
}