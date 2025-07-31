class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var d = [Int: Int]()
        for (i, x) in nums.enumerated() {
            if let j = d[target - x] {
                return [j, i]
            }
            d[x] = i
        }
        return []
    }
}