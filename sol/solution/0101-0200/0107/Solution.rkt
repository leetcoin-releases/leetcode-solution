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
(define/contract (level-order-bottom root)
  (-> (or/c tree-node? #f) (listof (listof exact-integer?)))
  (if (not root)
      '()
      (reverse (level-order root))))
(define (level-order root)
  (let ([queue (list (cons root 0))] 
        [acc '()])                   
    (let loop ([q queue] [acc acc])
      (if (null? q)
          (map cdr (sort acc < #:key car)) 
          (let* ([node-level (car q)]
                 [node (car node-level)]
                 [level (cdr node-level)]
                 [val (tree-node-val node)]
                 [left (tree-node-left node)]
                 [right (tree-node-right node)]
                 [new-queue (append (cdr q)
                                    (if left (list (cons left (+ level 1))) '())
                                    (if right (list (cons right (+ level 1))) '()))]
                 [new-acc (update-acc acc level val)])
            (loop new-queue new-acc))))))
(define (update-acc acc level val)
  (cond
    [(null? acc) (list (cons level (list val)))]
    [(= (caar acc) level)
     (cons (cons level (append (cdar acc) (list val))) (cdr acc))]
    [else (cons (car acc) (update-acc (cdr acc) level val))]))