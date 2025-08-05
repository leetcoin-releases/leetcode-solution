class Solution {
  bool isHappy(int n) {
    int getNext(int num) {
      int sum = 0;
      while (num > 0) {
        int d = num % 10;
        sum += d * d;
        num ~/= 10;
      }
      return sum;
    }
    int slow = n, fast = getNext(n);
    while (fast != 1 && slow != fast) {
      slow = getNext(slow);
      fast = getNext(getNext(fast));
    }
    return fast == 1;
  }
}
