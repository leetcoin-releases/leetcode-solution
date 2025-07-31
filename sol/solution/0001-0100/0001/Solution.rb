# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    d = {}
    nums.each_with_index do |x, i|
        if d.key?(target - x)
            return [d[target - x], i]
        end
        d[x] = i
    end
end