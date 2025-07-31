# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows
  rows = Array.new([num_rows, s.length].min, "")
  cur_row, going_down = 0, false
  s.each_char do |c|
    rows[cur_row] += c
    going_down = !going_down if cur_row == 0 || cur_row == num_rows - 1
    cur_row += going_down ? 1 : -1
  end
  rows.join
end