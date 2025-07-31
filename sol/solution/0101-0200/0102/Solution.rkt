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
; (struct TreeNode (val left right)) ; Remove this line, use tree-node only
(define (level-order root)
  (define result '())
  (define queue (if root (list root) '()))
  (let loop ([q queue] [res result])
    (if (null? q) (reverse res)
        (let* ([level (map tree-node-val q)]
               [next-q (apply append
                              (map (lambda (n)
                                     (filter values (list (tree-node-left n) (tree-node-right n))))
                                   q))])
          (loop next-q (cons level res))))))
