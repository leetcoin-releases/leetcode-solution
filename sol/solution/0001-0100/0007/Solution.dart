class Solution {
    bool isValidNumber(int x) {
      return (x>=-2147483648 && x<=2147483647)? true : false; 
    }
    bool isNegative (int x) {
      return x<0 ? true : false;
    }
  int reverse(int x) {
    bool isNegativeNum = isNegative(x);
    x = isNegativeNum ? -x : x;
    int lastDigit = 0; 
    int revNum = 0;
    while (x > 0) {
      lastDigit = x % 10;
      if (revNum > (2147483647 - lastDigit) ~/ 10) {
        return 0;
      }
      revNum = revNum * 10 + lastDigit;
      x = x ~/ 10;
    }
    return isNegativeNum ? -revNum : revNum;
  }
}