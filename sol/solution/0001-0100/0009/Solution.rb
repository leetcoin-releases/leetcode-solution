# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0 || (x % 10 == 0 && x != 0)
  reversed = 0
  while x > reversed
    reversed = reversed * 10 + x % 10
    x /= 10
  end
  x == reversed || x == reversed / 10
end