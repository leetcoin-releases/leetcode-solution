# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
  while left < right
    right &= (right - 1)
  end
  right
end