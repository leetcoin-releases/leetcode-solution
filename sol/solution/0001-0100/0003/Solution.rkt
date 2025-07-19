(define (length-of-longest-substring s)
  (let loop ([i 0] [start 0] [res 0] [last (make-hash)])
    (if (>= i (string-length s)) res
      (let* ([c (string-ref s i)]
             [idx (hash-ref last c #f)]
             [start (if (and idx (>= idx start)) (+ idx 1) start)]
             [res (max res (+ 1 (- i start)))]
             [_ (hash-set! last c i)])
        (loop (+ i 1) start res last)))))
