# @param {String} s
# @return {Integer}
def roman_to_int(s)
    val = {'I'=>1, 'V'=>5, 'X'=>10, 'L'=>50, 'C'=>100, 'D'=>500, 'M'=>1000}
    res = 0
    s.chars.each_with_index do |c, i|
        if i < s.length - 1 && val[c] < val[s[i + 1]]
            res -= val[c]
        else
            res += val[c]
        end
    end
    res
end
