public class Solution {
    public bool IsHappy(int n) {
        int GetNext(int num) {
            int sum = 0;
            while (num > 0) {
                int d = num % 10;
                sum += d * d;
                num /= 10;
            }
            return sum;
        }
        int slow = n, fast = GetNext(n);
        while (fast != 1 && slow != fast) {
            slow = GetNext(slow);
            fast = GetNext(GetNext(fast));
        }
        return fast == 1;
    }
}
