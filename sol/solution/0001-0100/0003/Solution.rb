# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  last = {}
  res = start = 0
  s.chars.each_with_index do |c, i|
    if last[c] && last[c] >= start
      start = last[c] + 1
    end
    res = [res, i - start + 1].max
    last[c] = i
  end
  res
end