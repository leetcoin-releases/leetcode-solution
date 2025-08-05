func isHappy(n int) bool {
    getNext := func(num int) int {
        sum := 0
        for num > 0 {
            d := num % 10
            sum += d * d
            num /= 10
        }
        return sum
    }
    slow, fast := n, getNext(n)
    for fast != 1 && slow != fast {
        slow = getNext(slow)
        fast = getNext(getNext(fast))
    }
    return fast == 1
}
