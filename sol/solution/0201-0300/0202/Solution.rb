# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  get_next = ->(num) {
    num.digits.map { |d| d * d }.sum
  }
  slow = n
  fast = get_next.call(n)
  while fast != 1 && slow != fast
    slow = get_next.call(slow)
    fast = get_next.call(get_next.call(fast))
  end
  fast == 1
end
