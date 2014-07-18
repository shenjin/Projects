#lang racket

; CS136 W14: Assignment 1.0 Bonus
; Shen Jin 20512863

; this module provides tools that rely on the uw-api racket file
; more specifically, this file requires you to enter a building, and it will
; return the food sold by waterloo with the lowest fat content in the form of
; an association list

(require "uw-api.rkt")

(printf "Enter the building where you eat your food: ")


; find-value: String (listof (list String Any)) -> Any
;   PRE:  true
;   POST: returns the value that corresponds to the key from the association list
;         a string if the key is not in the associaiton list
; find-value takes in string as a key value and searches for it within an lst, which
; is an association list.
(define (find-value string lst) 
  (foldr (lambda (x y) (cond
                         [(string=? (first x) string)
                          (second x)]
                         [else y]))
         ""
         lst))

; find-store-number: String (listof (list String Any)) -> Any
;   PRE:  true
;   POST: returns a list of all the store numbers within a building
; find-store-number takes in building as a key value and searches for it within an lst, which
; is an association list.
(define (find-store-number building lst)
  (filter number? (foldr (lambda (x y) (cond
                                         [(string=? building (find-value "building" x))
                                          (cons (find-value "outlet_id" x) y)]
                                         [else y]))
                         empty
                         lst)))

; find-store-number: String (listof (list String Any)) -> Any
;   PRE:  true
;   POST: returns a list of each store within the building that contains all the food it serves
; find-store-number takes in s1 s2 as a key value and searches for it within an lst, which
; is an association list.
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

; find-products: String (any -> any) (listof (list String Any)) -> Any
;   PRE:  true
;   POST: returns a list of the daily food served for dinner and lunch
; find-products takes in string as a key value and a function f 
; searches within an lst, which is an association list to create
; an association list of the products each store sells for lunch and dinner
(define (find-products string f lst)
  (foldr (lambda (x y) (f (find-value string x) y))
         empty
         lst))

; find-products2: (listof (list String Any)) -> (listof Nat)
;   PRE:  true
;   POST: returns of the food numbers from the menu
; find-products2 takes a list of product numbers and generates
; the number of the food in a list
(define (find-products2 lst)
  (foldr (lambda (x y) (append (second x) y))
         empty
         lst))

; search-food: (listof (list String Nat)) -> AL
;   PRE:  true
;   POST: returns an assoiation list of the food product details
; search-food takes a list of product numbers and generates
; an association list of foods with their corresponding information
(define (search-food lst)
  (foldr (lambda (x y) (cons (uw-api (format "/foodservices/products/~a" x)) y))
         empty
         lst))

; order-by: string (listof (list String Nat)) -> AL
;   PRE:  true
;   POST: returns assoitiation list of the food products form the list of numbers
; order-by: takes a list of product information "lst" and produces another AL however
; this time, it will be the a list of a list of type and the product name
(define (order-by type lst)
  (foldr (lambda (x y) (cons (list (find-value type x) (find-value "product_name" x)) y))
         empty
         lst))

; menu-list: string -> AL
;   PRE:  true
;   POST: returns assoitiation list of the food products form the list of numbers for given building
; order-by: takes a string and produces an AL containing all the stores (including info) UW owns 
; in that building.
(define (menu-list building) (search-within 
                              "outlet_id"
                              "outlets" 
                              (find-store-number 
                               building 
                               (uw-api 
                                "/foodservices/locations"))))

; menu-list: string -> AL
;   PRE:  true
;   POST: returns assoitiation list of the food products in order of lowest fat content
; order-by: takes a string and produces an AL containing all the stores (including info) UW owns 
; in that building.
(define (find-lowest-fat building)
  (cond
    [(empty? (menu-list building))
     (format "No UW food outlets in: ~a" building)]
    [else
     (sort 
      (order-by 
       "total_fat_g" 
       (search-food 
        (remove-duplicates 
         (filter 
          number? 
          (find-products 
           "product_id" 
           cons
           (find-products2 
            (find-products 
             "meals"
             append
             (find-value 
              "menu"
              (first 
               (menu-list building))))))))))#:key car <)]))

(find-lowest-fat (symbol->string (read)))





