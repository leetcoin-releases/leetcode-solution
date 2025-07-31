class Solution(object):
    def reverse(self, x):
        INT_MAX, INT_MIN = 2**31 - 1, -2**31
        sign = -1 if x < 0 else 1
        x = abs(x)
        rev = 0
        while x != 0:
            rev = rev * 10 + x % 10
            x //= 10
        rev *= sign
        return rev if INT_MIN <= rev <= INT_MAX else 0
