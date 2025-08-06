(define (roman-to-int s)
  (define val (hash
    #\I 1 #\V 5 #\X 10 #\L 50
    #\C 100 #\D 500 #\M 1000))
  (define chars (string->list s))
  (define (helper lst acc)
    (cond
      [(null? lst) acc]
      [(and (pair? (cdr lst)) (< (hash-ref val (car lst)) (hash-ref val (cadr lst))))
       (helper (cdr lst) (- acc (hash-ref val (car lst))))]
      [else
       (helper (cdr lst) (+ acc (hash-ref val (car lst))))]))
  (helper chars 0))
