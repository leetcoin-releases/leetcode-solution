(define (square-sum n)
  (if (= n 0) 0
      (+ (sqr (remainder n 10)) (square-sum (quotient n 10)))))
(define (is-happy n)
  (define (cycle slow fast)
    (cond [(= fast 1) #t]
          [(= slow fast) #f]
          [else (cycle (square-sum slow) (square-sum (square-sum fast)))]))
  (cycle n (square-sum n)))