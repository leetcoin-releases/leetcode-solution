object Solution {
  def isPalindrome(x: Int): Boolean = {
    if (x < 0 || (x % 10 == 0 && x != 0)) false
    else {
      var reversed = 0
      var num = x
      while (num > reversed) {
        reversed = reversed * 10 + num % 10
        num /= 10
      }
      num == reversed || num == reversed / 10
    }
  }
}