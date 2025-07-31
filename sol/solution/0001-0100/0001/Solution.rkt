(define/contract (two-sum nums target)
    (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
    (let ([indices (make-hasheqv)])
        (define (loop nums i)
            (if (null? nums)
                (error "Nothing Found!")
                (match-let* ([(list-rest num nums-remaining) nums]
                    [diff (- target num)])
                    (if (hash-has-key? indices diff)
                        (list (hash-ref indices diff) i)
                        (begin
                            (hash-set! indices num i)
                            (loop nums-remaining (+ i 1)))))))
        (loop nums 0)))
