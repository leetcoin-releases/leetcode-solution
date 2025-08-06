# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.empty?
    prefix = strs[0]
    strs.each do |s|
        while !s.start_with?(prefix)
            prefix = prefix[0...-1]
            return "" if prefix.empty?
        end
    end
    prefix
end