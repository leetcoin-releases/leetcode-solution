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
(define/contract (max-depth root)
  (-> (or/c tree-node? #f) exact-integer?)
  (if (not root)
      0
      (add1 (max (max-depth (tree-node-left root))
                 (max-depth (tree-node-right root))))))
