class Solution {
    fun isPalindrome(x: Int): Boolean {
        if (x < 0 || (x % 10 == 0 && x != 0)) return false
        var reversed = 0
        var num = x
        while (num > reversed) {
            reversed = reversed * 10 + num % 10
            num /= 10
        }
        return num == reversed || num == reversed / 10
    }
}