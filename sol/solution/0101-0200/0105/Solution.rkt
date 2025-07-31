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
(define/contract (build-tree preorder inorder)
  (-> (listof exact-integer?) (listof exact-integer?) (or/c tree-node? #f))
  (define inorder-map
    (for/hash ([v inorder] [i (in-naturals)]) (values v i)))
  (define (helper pre-start pre-end in-start in-end)
    (if (or (>= pre-start pre-end) (>= in-start in-end))
        #f
        (let* ([root-val (list-ref preorder pre-start)]
               [root (make-tree-node root-val)]
               [in-root-idx (hash-ref inorder-map root-val)]
               [left-size (- in-root-idx in-start)])
          (set-tree-node-left! root (helper (+ pre-start 1) (+ pre-start 1 left-size) in-start in-root-idx))
          (set-tree-node-right! root (helper (+ pre-start 1 left-size) pre-end (+ in-root-idx 1) in-end))
          root)))
  (helper 0 (length preorder) 0 (length inorder)))