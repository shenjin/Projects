;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname encodingcompression) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; An EncodingTree is a tree with at least two leaf nodes, and is one of:
;; * a NestedListBinTree
;; * a NodeBinTree
;; * any implementation of a binary, leaf-labelled tree.

;; In addition, an EncodingTree has the following properties:
;; * the internal nodes of an EncodingTree always have exactly two children
;; * the leaf node values are unique, i.e. there will be no duplicate values in the tree.

;; A NestedListBinTree is one of:
;; * a Char
;; * (list NestedListBinTree NestedListBinTree)

(define-struct bt-node (left right))
;; A NodeBinTree is one of:
;; * a Char
;; * (make-bt-node NodeBinTree NodeBinTree) 

;; A BinaryCode is a non-empty String that contains only the characters #\0 and #\1.

;; Constants for testing

(define 2-char-bnt (make-bt-node #\z #\q))
(define 3-char-bnt (make-bt-node #\o 2-char-bnt))
(define 2-char-bnt2 (make-bt-node #\t #\e))
(define 5-char-bnt (make-bt-node 2-char-bnt2 3-char-bnt))
(define 7-char-bnt (make-bt-node 5-char-bnt (make-bt-node #\w #\space)))

(define 7-char-nested-list '(((#\t #\e) (#\o (#\z #\q))) (#\w #\space)))

(define big-bnt
  (make-bt-node
   (make-bt-node
    (make-bt-node #\a (make-bt-node #\i #\c))
    #\space)
   (make-bt-node
    (make-bt-node #\h #\e)
    (make-bt-node
     (make-bt-node
      (make-bt-node #\n #\.) 
      #\T)
     #\t))))

(define 2-char-nlt '(#\a #\b))
(define big-nlt
  '(((#\a (#\i #\c)) #\space) ((#\h #\e) (((#\n #\.) #\T) #\t))))

(define big-binary-code 
  "110110010101001100011101001011000011111001010110000011111001")

;; **************************************************
;;
;; CS135 Assignment 08, Question 3
;;
;; **************************************************

;;********************************************************************************************************

;; **************************************************
;; DATA DEFINITION and CONSTANTS
;; **************************************************

(define-struct node (key value left right))
;; A binary tree (Bt) is one of:
;; empty
;; (make-node Num Any Bt Bt)

(define my-node
  (make-node 2 "node" 
             (make-node 0 "node"
                        (make-node 0 "node"
                                   (make-node 0 #\a empty empty)
                                   (make-node 1 "node" 
                                              (make-node 0 #\i empty empty)
                                              (make-node 1 #\c empty empty)))
                        (make-node 1 #\space empty empty))
             (make-node 1 "node"
                        (make-node 0 "node"
                                   (make-node 0 #\h empty empty)
                                   (make-node 1 #\e empty empty))
                        (make-node 1 "node"
                                   (make-node 0 "node"
                                              (make-node 0 "node"
                                                         (make-node 0 #\n empty empty)
                                                         (make-node 1 #\. empty empty))
                                              (make-node 1 #\T empty empty))
                                   (make-node 1 #\t empty empty)))))

(define ass-list (list (list #\a 60)
                       (list #\i 32)
                       (list #\c 1)
                       (list #\space 1)
                       (list #\h 1)
                       (list #\e 1)
                       (list #\n 1)
                       (list #\. 1)
                       (list #\T 1)
                       (list #\t 1)))

(define compressed-big-bnt
  (make-bt-node
   #\a
   (make-bt-node
    #\i
    (make-bt-node
     (make-bt-node 
      (make-bt-node #\n #\.)
      (make-bt-node #\c #\space))
     (make-bt-node 
      (make-bt-node #\T #\h)
      (make-bt-node #\e #\t))))))

(define compressed-big-nlt 
  '(#\a (#\i (((#\c #\space) (#\h #\e)) ((#\n #\.) (#\T #\t))))))

(define compressed-my-node 
  (make-node 2 "node" 
             (make-node 0 #\a empty empty)
             (make-node 1 "node"
                        (make-node 0 #\i empty empty)
                        (make-node 1 "node"
                                   (make-node 0 "node"
                                              (make-node 0 "node"
                                                         (make-node 0 #\c empty empty)
                                                         (make-node 1 #\space empty empty))
                                              (make-node 1 "node"
                                                         (make-node 0 #\h empty empty)
                                                         (make-node 1 #\e empty empty)))
                                   (make-node 1 "node"
                                              (make-node 0 "node"
                                                         (make-node 0 #\n empty empty)
                                                         (make-node 1 #\. empty empty))
                                              (make-node 1 "node"
                                                         (make-node 0 #\T empty empty)
                                                         (make-node 1 #\t empty empty)))))))


;;********************************************************************************************************

(define my-tree-fn-left-par
  (local [;; my-tree-fn-left : EncodingTree -> EncodingTree
          ;; Purpose: To produce the left side of the encoding-tree
          (define (my-tree-fn-left encoding-tree) 
            (cond
              [(list? encoding-tree) (first encoding-tree)]
              [(bt-node? encoding-tree) (bt-node-left encoding-tree)]
              [(and (node? encoding-tree)
                    (node? (node-left encoding-tree))) (node-left encoding-tree)]
              [else 'Error]))] my-tree-fn-left))

(define my-tree-fn-right-par
  (local [;; my-tree-fn-right : EncodingTree -> EncodingTree
          ;; Purpose: to produce the right side of the encoding-tree
          (define (my-tree-fn-right encoding-tree) 
            (cond
              [(list? encoding-tree) (second encoding-tree)]
              [(bt-node? encoding-tree) (bt-node-right encoding-tree)]
              [(and (node? encoding-tree)
                    (node? (node-right encoding-tree))) (node-right encoding-tree)]
              [else 'Error]))] my-tree-fn-right))

(define leaf-node?-par
  (local [;; leaf-node? : EncodingTree -> Boolean
          ;; To check if encoding-tree is a leaf node or not
          (define (leaf-node? encoding-tree)
            (and (equal? 'Error (my-tree-fn-right-par encoding-tree))
                 (equal? 'Error (my-tree-fn-left-par encoding-tree))))] leaf-node?))

;; **************************************************
;; MAIN FUNCTION
;; **************************************************

;; compression-ratio : EncodingTree ne-AL (EncodingTree -> EncodingTree) (EncodingTree -> EncodingTree) 
;;                     (EncodingTree -> Boolean) -> Num
;; Purpose: To determine the total variable bit amount by using f1-left, f2-right, and f3-leaf? to
;;          determine the length of the bit for each key in association-list within encoding-tree.
;; Examples:
(check-within 
 (compression-ratio compressed-big-bnt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.41 0.01)
(check-within 
 (compression-ratio big-bnt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.8425 0.01)
(check-within 
 (compression-ratio big-nlt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.8425 0.01)

(define (compression-ratio encoding-tree association-list f1-left f2-right f3-leaf?)
  (/ (local [;; total-bits-variable-length : ne-AL EncodingTree -> Nat
             ;; Purpose: To add up all the individual bits from each association-list keys, with
             ;;          reference to the tree.
             (define (total-bits-variable-length association-list tree)
               (cond
                 [(empty? association-list) 0]
                 [else (+ (* (local [;; find-anything : Any EncodingTree -> Nat
                                     ;; Purpose: Determines the bit length of an anything that 
                                     ;;          is on the leaf of the tree.
                                     (define (find-anything anything tree n)
                                       (cond
                                         [(and (f3-leaf? tree) 
                                               (not (or (equal? anything tree)
                                                        (and
                                                         (node? tree)
                                                         (equal? anything (node-value tree))))))
                                          false]
                                         [(or (equal? anything tree)
                                              (and
                                               (node? tree)
                                               (equal? anything (node-value tree)))) n]
                                         [else (local [(define (helper2 left right)
                                                         (cond
                                                           [(number? left) left]
                                                           [(number? right) right]
                                                           [else false]
                                                           ))]
                                                 (helper2 (find-anything anything 
                                                                         (f1-left tree) 
                                                                         (+ 1 n))
                                                          (find-anything anything 
                                                                         (f2-right tree) 
                                                                         (+ 1 n))))]))]
                               (find-anything (first (first association-list)) tree 0))
                             (second (first association-list)))
                          (total-bits-variable-length (rest association-list) tree))]))]
       (total-bits-variable-length association-list encoding-tree))
     (local [;; total-bits-fixed-length : ne-AL
             ;; Purpose: To find the total amount of bits needed for fixed-length encoding.
             (define (total-bits-fixed-length association-list)
               (local [;; association-length : ne-AL
                       ;; Purpose : To determine the length of the non empty association-list.
                       (define (association-length association-list)
                         (cond
                           [(empty? association-list) 0]
                           [else (+ 1 (association-length (rest association-list)))]))]
                 (* (local [(define fixed-length-encoding
                              (ceiling (/ (log (association-length association-list))
                                          (log 2))))]
                      fixed-length-encoding)
                    (local [;; total-items : ne-AL
                            ;; Purpose: Counts the total amount of repetitions of 
                            ;;          each value in the association list.
                            (define (total-items association-list)
                              (cond
                                [(empty? association-list) 0]
                                [else (+ (second (first association-list))
                                         (total-items (rest association-list)))]))]
                      (total-items association-list)))))]
       (total-bits-fixed-length association-list))))

;; Tests:
(check-within 
 (compression-ratio compressed-big-bnt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.41 0.01)
(check-within 
 (compression-ratio big-bnt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.8425 0.01)
(check-within 
 (compression-ratio compressed-big-nlt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.41 0.01)
(check-within 
 (compression-ratio big-nlt ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.8425 0.01)
(check-within 
 (compression-ratio my-node ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.8425 0.01)
(check-within 
 (compression-ratio compressed-my-node ass-list my-tree-fn-left-par my-tree-fn-right-par leaf-node?-par) #i0.41 0.01)