# @param {String} s
# @return {Integer}
def my_atoi(s)
  i, sign, result = 0, 1, 0
  s = s.lstrip
  if i < s.length && ['+', '-'].include?(s[i])
    sign = -1 if s[i] == '-'
    i += 1
  end
  while i < s.length && s[i] =~ /\d/
    digit = s[i].to_i
    if result > (2**31 - 1 - digit) / 10
      return sign == 1 ? 2**31 - 1 : -2**31
    end
    result = result * 10 + digit
    i += 1
  end
  sign * result
end