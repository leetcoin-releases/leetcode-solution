class Solution:
    def isHappy(self, n: int) -> bool:
        def get_next(num):
            return sum(int(d) ** 2 for d in str(num))
        slow = n
        fast = get_next(n)
        while fast != 1 and slow != fast:
            slow = get_next(slow)
            fast = get_next(get_next(fast))
        return fast == 1
