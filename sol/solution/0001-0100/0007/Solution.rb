# @param {Integer} x
# @return {Integer}
def reverse(x)
    rev = 0
    sign = x < 0 ? -1 : 1
    x = x.abs
    while x != 0
        pop = x % 10
        x /= 10
        if rev > 214748364 || (rev == 214748364 && pop > 7)
            return 0
        end
        rev = rev * 10 + pop
    end
    rev * sign
end
