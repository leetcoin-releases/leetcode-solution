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
(define/contract (sorted-array-to-bst nums)
  (-> (listof exact-integer?) (or/c tree-node? #f))
  (define (build-bst left right)
    (if (> left right)
        #f
        (let* ([mid (quotient (+ left right) 2)]
               [root (make-tree-node (list-ref nums mid))])
          (set-tree-node-left! root (build-bst left (- mid 1)))
          (set-tree-node-right! root (build-bst (+ mid 1) right))
          root)))
  (if (null? nums)
      #f
      (build-bst 0 (- (length nums) 1))))