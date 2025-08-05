/**
 * @param {number} n
 * @return {boolean}
 */
var isHappy = function(n) {
    const getNext = (num) => {
        let sum = 0;
        while (num > 0) {
            let d = num % 10;
            sum += d * d;
            num = Math.floor(num / 10);
        }
        return sum;
    };
    let slow = n, fast = getNext(n);
    while (fast !== 1 && slow !== fast) {
        slow = getNext(slow);
        fast = getNext(getNext(fast));
    }
    return fast === 1;
};