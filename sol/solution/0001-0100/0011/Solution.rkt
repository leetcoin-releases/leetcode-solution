(define (max-area height)
  (define ht (list->vector height))
  (define (loop left right max-area)
    (if (>= left right)
        max-area
        (let* ([left-height (vector-ref ht left)]
               [right-height (vector-ref ht right)]
               [width (- right left)]
               [area (* (min left-height right-height) width)]
               [new-max (max max-area area)])
          (if (< left-height right-height)
              (loop (add1 left) right new-max)
              (loop left (sub1 right) new-max)))))
  (loop 0 (sub1 (vector-length ht)) 0))