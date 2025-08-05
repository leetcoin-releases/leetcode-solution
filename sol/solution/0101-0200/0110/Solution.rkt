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
(define (is-balanced root)
  (define (check node)
    (if (not node) 0
        (let ([left (check (tree-node-left node))])
          (if (= left -1) -1
              (let ([right (check (tree-node-right node))])
                (if (= right -1) -1
                    (if (> (abs (- left right)) 1) -1
                        (+ 1 (max left right)))))))))
  (not (= (check root) -1)))
