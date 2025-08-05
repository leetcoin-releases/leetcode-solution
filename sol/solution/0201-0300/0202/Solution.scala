object Solution {
  def isHappy(n: Int): Boolean = {
    def getNext(num: Int): Int =
      num.toString.map(c => (c.asDigit) * (c.asDigit)).sum
    var slow = n
    var fast = getNext(n)
    while (fast != 1 && slow != fast) {
      slow = getNext(slow)
      fast = getNext(getNext(fast))
    }
    fast == 1
  }
}
