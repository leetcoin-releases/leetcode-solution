(define/contract (three-sum nums)
  (-> (listof exact-integer?) (listof (listof exact-integer?)))
  (define sorted (sort nums <))
  (define sorted-vec (list->vector sorted))
  (define len (vector-length sorted-vec))
  (define (loop i acc)
    (if (>= i (- len 2))
        (reverse acc)
        (if (and (> i 0) (= (vector-ref sorted-vec i) (vector-ref sorted-vec (- i 1))))
            (loop (+ i 1) acc)
            (let two-pointer ([l (+ i 1)] [r (- len 1)] [acc acc])
              (if (>= l r)
                  (loop (+ i 1) acc)
                  (let* ([a (vector-ref sorted-vec i)]
                         [b (vector-ref sorted-vec l)]
                         [c (vector-ref sorted-vec r)]
                         [sum (+ a b c)])
                    (cond
                      [(< sum 0)
                       (two-pointer (+ l 1) r acc)]
                      [(> sum 0)
                       (two-pointer l (- r 1) acc)]
                      [else
                       (define new-acc (cons (list a b c) acc))
                       (define (skip-left l)
                         (let loop-l ([l l])
                           (if (and (< (+ l 1) r) (= (vector-ref sorted-vec l) (vector-ref sorted-vec (+ l 1))))
                               (loop-l (+ l 1))
                               (+ l 1))))
                       (define (skip-right r)
                         (let loop-r ([r r])
                           (if (and (> (- r 1) l) (= (vector-ref sorted-vec r) (vector-ref sorted-vec (- r 1))))
                               (loop-r (- r 1))
                               (- r 1))))
                       (two-pointer (skip-left l) (skip-right r) new-acc)])))))))
  (loop 0 '()))
