;; Racket solution (not native LeetCode language but provided)
(define (remove-invalid-parentheses s)
  (define (count-removals s)
    (let loop ([i 0] [l 0] [r 0])
      (if (= i (string-length s))
          (list l r)
          (let ([c (string-ref s i)])
            (cond
              [(char=? c #\() (loop (add1 i) (add1 l) r)]
              [(char=? c #\))
               (if (> l 0)
                   (loop (add1 i) (sub1 l) r)
                   (loop (add1 i) l (add1 r)))]
              [else (loop (add1 i) l r)])))))
  (define vals (count-removals s))
  (define rl (car vals))
  (define rr (cadr vals))
  (define res (make-hash))
  (define (dfs i rl rr open path)
    (if (= i (string-length s))
        (when (and (= rl 0) (= rr 0) (= open 0))
          (hash-set! res path #t))
        (let ([c (string-ref s i)])
          (cond
            [(char=? c #\()
             (when (> rl 0)
               (dfs (add1 i) (sub1 rl) rr open path))
             (dfs (add1 i) rl rr (add1 open) (string-append path (string c)))]
            [(char=? c #\))
             (when (> rr 0)
               (dfs (add1 i) rl (sub1 rr) open path))
             (when (> open 0)
               (dfs (add1 i) rl rr (sub1 open) (string-append path (string c))))]
            [else
             (dfs (add1 i) rl rr open (string-append path (string c)))]))))
  (dfs 0 rl rr 0 "")
  (hash-keys res))
