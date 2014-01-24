#lang racket
(require "uw-api.rkt")


(define (find-value string lst) 
  (foldr (lambda (x y) (cond
                         [(string=? (first x) string)
                          (second x)]
                         [else y]))
         ""
         lst))

(define (find-store-number building lst)
  (filter number? (foldr (lambda (x y) (cond
                                         [(string=? building (find-value "building" x))
                                          (cons (find-value "outlet_id" x) y)]
                                         [else y]))
                         empty
                         lst)))

(define (search-within s1 s2 lst)
  (foldr (lambda (x y) (append (foldr (lambda (x1 y1) (cond
                                                        [(equal? x (find-value s1 x1))
                                                         (cons x1 y1)]
                                                        [else y1]))
                                      empty
                                      (find-value s2 (uw-api "/foodservices/menu")))
                               y))
         empty
         lst))

(define (find-products string f lst)
  (foldr (lambda (x y) (f (find-value string x) y))
         empty
         lst))

(define (find-products2 lst)
  (foldr (lambda (x y) (append (second x) y))
         empty
         lst))

(define (search-food lst)
  (foldr (lambda (x y) (cons (uw-api (format "/foodservices/products/~a" x)) y))
         empty
         lst))

(define (order-by type lst)
  (foldr (lambda (x y) (cons (list (find-value type x) (find-value "product_name" x)) y))
         empty
         lst))

(sort (order-by "total_fat_g" 
                (search-food 
                 (remove-duplicates 
                  (filter number? 
                          (find-products "product_id" cons
                                         (find-products2 
                                          (find-products "meals" append
                                                         (find-value "menu"
                                                                     (first 
                                                                      (search-within "outlet_id" "outlets" 
                                                                                           (find-store-number "DC" (uw-api "/foodservices/locations")))))))))))) #:key car <)









