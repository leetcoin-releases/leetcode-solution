class Solution {
    fun isHappy(n: Int): Boolean {
        fun getNext(num: Int): Int {
            var n = num
            var sum = 0
            while (n > 0) {
                val d = n % 10
                sum += d * d
                n /= 10
            }
            return sum
        }
        var slow = n
        var fast = getNext(n)
        while (fast != 1 && slow != fast) {
            slow = getNext(slow)
            fast = getNext(getNext(fast))
        }
        return fast == 1
    }
}
