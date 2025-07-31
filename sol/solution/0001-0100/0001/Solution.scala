import scala.collection.mutable
object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] = {
        val d = mutable.Map[Int, Int]()
        var ans: Array[Int] = Array()
        for (i <- nums.indices if ans.isEmpty) { 
            if (d.contains(target - nums(i))) {
                ans = Array(d(target - nums(i)), i)
            } else {
                d(nums(i)) = i
            }
        }
        ans
    }
}