def three_sum(nums)
  nums.sort!
  res = []
  (0...nums.length - 2).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    l, r = i + 1, nums.length - 1
    while l < r
      sum = nums[i] + nums[l] + nums[r]
      if sum < 0
        l += 1
      elsif sum > 0
        r -= 1
      else
        res << [nums[i], nums[l], nums[r]]
        l += 1
        r -= 1
        l += 1 while l < r && nums[l] == nums[l - 1]
        r -= 1 while l < r && nums[r] == nums[r + 1]
      end
    end
  end
  res
end
