(define num-matrix%
  (class object%
    (super-new)
    ; matrix : (listof (listof exact-integer?))
    (init-field matrix)
    (define m (length matrix))
    (define n (length (first matrix)))
    ;; Create prefix sum table with an extra row & col
    (define prefix (make-vector (add1 m)))
    (for ([i (in-range (add1 m))])
      (vector-set! prefix i (make-vector (add1 n) 0)))
    ;; Build prefix sum
    (for ([i (in-range 1 (add1 m))])
      (for ([j (in-range 1 (add1 n))])
        (define val (list-ref (list-ref matrix (sub1 i)) (sub1 j)))
        (vector-set! (vector-ref prefix i) j
          (+ (vector-ref (vector-ref prefix (sub1 i)) j)
             (vector-ref (vector-ref prefix i) (sub1 j))
             (- (vector-ref (vector-ref prefix (sub1 i)) (sub1 j)))
             val))))
    ; sum-region : exact-integer? exact-integer? exact-integer? exact-integer? -> exact-integer?
    (define/public (sum-region row1 col1 row2 col2)
      (let ([A (vector-ref (vector-ref prefix (add1 row2)) (add1 col2))]
            [B (vector-ref (vector-ref prefix row1) (add1 col2))]
            [C (vector-ref (vector-ref prefix (add1 row2)) col1)]
            [D (vector-ref (vector-ref prefix row1) col1)])
        (- (+ A D) (+ B C))))))
;; Your num-matrix% object will be instantiated and called as such:
;; (define obj (new num-matrix% [matrix matrix]))
;; (define param_1 (send obj sum-region row1 col1 row2 col2))