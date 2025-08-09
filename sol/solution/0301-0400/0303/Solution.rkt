(define num-array%
    (class object%
        (super-new)
        ; nums : (listof exact-integer?)
        (init-field nums)
        ; prefix-sums : (vectorof exact-integer?)
        (define prefix-sums
            (let ([v (make-vector (+ 1 (length nums)) 0)])
                (for ([i (in-range (length nums))])
                    (vector-set! v (+ i 1) (+ (vector-ref v i) (list-ref nums i))))
                v))
        ; sum-range : exact-integer? exact-integer? -> exact-integer?
        (define/public (sum-range left right)
            (- (vector-ref prefix-sums (+ right 1))
                 (vector-ref prefix-sums left)))))
;; Your num-array% object will be instantiated and called as such:
;; (define obj (new num-array% [nums nums]))
;; (define param_1 (send obj sum-range left right))