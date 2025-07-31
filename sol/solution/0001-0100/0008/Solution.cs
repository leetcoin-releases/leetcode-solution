public class Solution {
    public int MyAtoi(string s) {
        int i = 0, n = s.Length, sign = 1, result = 0;
        while (i < n && s[i] == ' ') i++;
        if (i < n && (s[i] == '+' || s[i] == '-')) sign = (s[i++] == '-') ? -1 : 1;
        while (i < n && char.IsDigit(s[i])) {
            int digit = s[i++] - '0';
            if (result > (Int32.MaxValue - digit) / 10)
                return sign == 1 ? Int32.MaxValue : Int32.MinValue;
            result = result * 10 + digit;
        }
        return result * sign;
    }
}
