; Definition for a binary tree node.
#|

; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node
  (val left right) #:mutable #:transparent)

; constructor
(define (make-tree-node [val 0])
  (tree-node val #f #f))

|#

(define (is-symmetric root)
  (define (is-mirror t1 t2)
    (cond
      [(and (not t1) (not t2)) #t]
      [(or (not t1) (not t2)) #f]
      [(and (= (tree-node-val t1) (tree-node-val t2))
            (is-mirror (tree-node-left t1) (tree-node-right t2))
            (is-mirror (tree-node-right t1) (tree-node-left t2)))]
      [else #f]))
  (is-mirror root root))
