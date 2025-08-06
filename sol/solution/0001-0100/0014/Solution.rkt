(require racket/string)
(define (longest-common-prefix strs)
  (if (null? strs)
      ""
      (let loop ((prefix (car strs)) (rest (cdr strs)))
        (cond
          [(null? rest) prefix]
          [else
           (define s (car rest))
           (define (common p)
             (if (or (string=? p "") (string-prefix? s p))
                 p
                 (common (substring p 0 (- (string-length p) 1)))))
           (loop (common prefix) (cdr rest))]))))