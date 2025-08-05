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
(define (remove-elements head val)
  (define dummy (make-list-node 0))
  (set-list-node-next! dummy head)
  (define curr dummy)
  (let loop ()
    (when (list-node-next curr)
      (if (= (list-node-val (list-node-next curr)) val)
          (set-list-node-next! curr (list-node-next (list-node-next curr)))
          (set! curr (list-node-next curr)))
      (loop)))
  (list-node-next dummy))