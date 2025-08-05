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
(define/contract (build-tree inorder postorder)
  (-> (listof exact-integer?) (listof exact-integer?) (or/c tree-node? #f))
  (let ([in-map (for/hash ([v inorder] [i (in-range (length inorder))])
                  (values v i))]
        [post-index (box (- (length postorder) 1))])
    (define (build-tree-helper in-start in-end)
      (if (> in-start in-end)
          #f
          (let* ([root-val (list-ref postorder (unbox post-index))]
                 [root (make-tree-node root-val)]
                 [in-index (hash-ref in-map root-val)])
            (set-box! post-index (- (unbox post-index) 1))
            (set-tree-node-right! root (build-tree-helper (+ in-index 1) in-end))
            (set-tree-node-left! root (build-tree-helper in-start (- in-index 1)))
            root)))
    (build-tree-helper 0 (- (length inorder) 1))))