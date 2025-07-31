(define (reverse x)
  (define MAX 2147483647)
  (define MIN -2147483648)
  (define (helper x rev)
    (if (= x 0)
        rev
        (let* ((pop (remainder x 10))
               (x1 (quotient x 10))
               (rev1 (+ (* rev 10) pop)))
          (if (or (> rev1 MAX) (< rev1 MIN))
              0
              (helper x1 rev1)))))
  (helper x 0))
