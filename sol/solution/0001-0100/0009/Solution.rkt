(define (is-palindrome x)
  (cond
    [(or (< x 0) (and (= (modulo x 10) 0) (not (= x 0)))) #f]
    [else
     (let loop ([num x] [reversed 0])
       (if (> num reversed)
           (loop (quotient num 10) (+ (* reversed 10) (modulo num 10)))
           (or (= num reversed) (= num (quotient reversed 10)))))]))