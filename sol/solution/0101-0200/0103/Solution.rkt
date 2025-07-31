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
(define/contract (zigzag-level-order root)
  (-> (or/c tree-node? #f) (listof (listof exact-integer?)))
  (define result '())
  (define queue (if root (list root) '()))
  (define left-to-right #t)
  (let loop ()
    (when (not (null? queue))
      (define level '())
      (define next-queue '())
      (for ([node queue])
        (set! level (cons (tree-node-val node) level))
        (when (tree-node-left node)
          (set! next-queue (append next-queue (list (tree-node-left node)))))
        (when (tree-node-right node)
          (set! next-queue (append next-queue (list (tree-node-right node))))))
      (set! result
            (append result
                    (list (if left-to-right (reverse level) level))))
      (set! queue next-queue)
      (set! left-to-right (not left-to-right))
      (loop)))
  result)