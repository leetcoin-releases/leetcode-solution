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
(define (list-length node)
  (if (not node)
      0
      (+ 1 (list-length (list-node-next node)))))
(define (list-nth node n)
  (if (or (not node) (= n 0))
      node
      (list-nth (list-node-next node) (- n 1))))
(define/contract (sorted-list-to-bst head)
  (-> (or/c list-node? #f) (or/c tree-node? #f))
  (define len (list-length head))
  (define (build-bst start end)
    (if (>= start end)
        #f
        (let* ([mid (quotient (+ start end) 2)]
               [mid-node (list-nth head mid)]
               [root (make-tree-node (list-node-val mid-node))])
          (set-tree-node-left! root (build-bst start mid))
          (set-tree-node-right! root (build-bst (+ mid 1) end))
          root)))
  (build-bst 0 len))