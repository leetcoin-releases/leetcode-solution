(define (my-atoi s)
  (define INT-MAX 2147483647)
  (define INT-MIN -2147483648)
  (define trimmed (string-trim s))
  (define len (string-length trimmed))
  (define (loop i sign result)
    (if (or (>= i len) (not (char-numeric? (string-ref trimmed i))))
        (* sign result)
        (let* ((digit (- (char->integer (string-ref trimmed i)) 48))
               (overflow? (or (> result (/ (- INT-MAX digit) 10)))))
          (if overflow?
              (if (= sign 1) INT-MAX INT-MIN)
              (loop (+ i 1) sign (+ (* result 10) digit))))))
  (if (= len 0) 0
      (let* ((first (string-ref trimmed 0))
             (sign (cond [(char=? first #\-) -1]
                         [(char=? first #\+) 1]
                         [else 1]))
             (start (if (or (char=? first #\-) (char=? first #\+)) 1 0)))
        (loop start sign 0))))
