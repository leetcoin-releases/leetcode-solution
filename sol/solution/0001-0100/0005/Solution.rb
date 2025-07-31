# @param {String} s
# @return {String}
def longest_palindrome(s)
    return s if s == s.reverse
    window_size = 1
    start = 0
    (1...s.size).each do |i|
        if i - window_size >= 0 && s[i - window_size..i] == s[i - window_size..i].reverse
            start = i - window_size
            window_size += 1
        elsif i - window_size >= 1 && s[i - window_size - 1..i] == s[i - window_size - 1..i].reverse
            start = i - window_size - 1
            window_size += 2
        end
    end
    s[start, window_size]
end