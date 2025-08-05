class Solution {
    func isHappy(_ n: Int) -> Bool {
        func getNext(_ num: Int) -> Int {
            var sum = 0, n = num
            while n > 0 {
                let d = n % 10
                sum += d * d
                n /= 10
            }
            return sum
        }
        var slow = n, fast = getNext(n)
        while fast != 1 && slow != fast {
            slow = getNext(slow)
            fast = getNext(getNext(fast))
        }
        return fast == 1
    }
}
