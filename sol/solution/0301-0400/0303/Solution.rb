class NumArray
=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @total_sum = 0
        @prefix_sum = []
        nums.each_with_index do |element, index|
            @total_sum += element
            @prefix_sum[index] = @total_sum
        end
    end
=begin
    :type left: Integer
    :type right: Integer
    :rtype: Integer
=end
    def sum_range(left, right)
        left.zero? ? @prefix_sum[right] : @prefix_sum[right] - @prefix_sum[left -1]
    end
end
# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(left, right)