; Definition for singly-linked list:
#|
; val : integer?
; next : (or/c list-node? #f)
(struct list-node
  (val next) #:mutable #:transparent)
; constructor
(define (make-list-node [val 0])
  (list-node val #f))
|#
(define/contract (add-two-numbers l1 l2)
  (-> (or/c list-node? #f) (or/c list-node? #f) (or/c list-node? #f))
  (let ([dummy (list-node 0 #f)])
    (let loop ([curr dummy] [p1 l1] [p2 l2] [carry 0])
      (if (or p1 p2 (> carry 0))
          (let* ([sum (+ carry
                        (if p1 (list-node-val p1) 0)
                        (if p2 (list-node-val p2) 0))]
                 [new-carry (quotient sum 10)]
                 [new-node (list-node (remainder sum 10) #f)])
            (set-list-node-next! curr new-node)
            (loop new-node
                  (if p1 (list-node-next p1) #f)
                  (if p2 (list-node-next p2) #f)
                  new-carry))
          (list-node-next dummy)))))