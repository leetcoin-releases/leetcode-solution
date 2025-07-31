(define (is-match s p)
  (let* ([m (string-length s)]
         [n (string-length p)]
         [dp (build-vector (+ m 1) (λ (_) (make-vector (+ n 1) #f)))])
    (vector-set! (vector-ref dp 0) 0 #t)
    (for ([j (in-range 2 (+ n 1) 2)])
      (when (and (equal? (string-ref p (- j 1)) #\*) (vector-ref (vector-ref dp 0) (- j 2)))
        (vector-set! (vector-ref dp 0) j #t)))
    (for* ([i (in-range 1 (+ m 1))]
           [j (in-range 1 (+ n 1))])
      (if (equal? (string-ref p (- j 1)) #\*)
          (vector-set! (vector-ref dp i) j
                       (or (vector-ref (vector-ref dp i) (- j 2))
                           (and (vector-ref (vector-ref dp (- i 1)) j)
                                (or (equal? (string-ref s (- i 1)) (string-ref p (- j 2)))
                                    (equal? (string-ref p (- j 2)) #\.)))))
          (vector-set! (vector-ref dp i) j
                       (and (vector-ref (vector-ref dp (- i 1)) (- j 1))
                            (or (equal? (string-ref s (- i 1)) (string-ref p (- j 1)))
                                (equal? (string-ref p (- j 1)) #\.))))))
    (vector-ref (vector-ref dp m) n)))