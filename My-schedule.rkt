#lang racket
(require "uw-api.rkt")

(define (section-info term subject catalog section)
  (define string-term (number->string term))
  (define string-catalog (number->string catalog))
  (define api-perameter 
    (uw-api 
     (format "/terms/~a/~a/~a/schedule" string-term subject string-catalog)))
  (define inner-lst
    (foldr (lambda (x y) (cond
                           [(string=? (second (first x)) section)
                            (foldr (lambda (x y) 
                                     (cond
                                       [(string=? (first x) "classes")
                                        x]
                                       [else y]))
                                   "taco"
                                   x)]
                           [else y]))
           "bell"
           api-perameter))
  
  (define (flatten-lst list)
    (foldr (lambda (x y) (cond
                           [(list? x)
                            (append (flatten-lst x) y)]
                           [else (cons x y)]))
           empty
           list))
  
  (define (last-of-lst list)
    (foldl (lambda (x y) x)
           ""
           list))
  
  (define (find-item a)
    (last-of-lst (foldr (lambda (x y) (cond
                                        [(equal? x a) (first y)]
                                        [else (cons (cons x empty) y)]))
                        empty
                        (flatten-lst inner-lst))))
  
  (format "~a ~a ~a ~a-~a ~a ~a ~a ~a" 
          subject 
          (number->string catalog)
          section
          (find-item "start_time")
          (find-item "end_time")
          (find-item "weekdays")
          (find-item "building")
          (find-item "room")
          (find-item "instructors")))


(define (build-list term subject-lst catalog-lst section-lst)
  (cond
    [(empty? subject-lst)
     empty]
    [else
     (cons
      (section-info term 
                    (first subject-lst)
                    (first catalog-lst)
                    (first section-lst))
      (build-list term 
                  (rest subject-lst)
                  (rest catalog-lst)
                  (rest section-lst)))]))

(build-list 1141   
            '("CS" "MATH" "MATH" "ECON" "ENGL")
            '(136 136 138 102 119)
            '("LEC 001" "LEC 001" "LEC 003" "LEC 006" "LEC 001"))