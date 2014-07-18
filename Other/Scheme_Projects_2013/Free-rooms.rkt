#lang racket

(require "uw-api.rkt")
(define current-time (substring (second (first (filter (lambda (x) (string=? (first x) "datetime")) (uw-api "/server/time")))) 11 16))

(define (my-filter order string lst)
  (filter (lambda (x) (string=? (order x) string)) lst))

(define (my-al-l order al)
  (foldr (lambda (x y) (cons (order x) y)) empty al))

(define (building-directory lst)
  (second (first (second (first (first (second (first lst))))))))
(define (room-directory lst)
  (second (second (second (first (first lst))))))

(define (class-location-lst directory subject)
  (foldr (lambda (x y) 
           (cons (list
                  (second (first (my-filter first "class_number" x)))
                  (directory (my-filter first "classes" x))) y))
         empty
         (uw-api (format "/terms/1141/~a/schedule" subject))))

(define (subject-at-building subject building)
  (my-al-l first (my-filter second building (class-location-lst building-directory subject))))

(define (class-time-check class-number string)
  (filter (lambda (x) (string=? (first x) string))
          (first (uw-api (format "/courses/~a/schedule" class-number)))))

(define (dates-directory lst)
  (second (second (first (second (first lst))))))

(define (course-check course-number-lst)
  (cond
    [(empty? course-number-lst) empty]
    [else (cons
           (list (first course-number-lst) 
                 (second (third (second (second (first (second (first (class-time-check (first course-number-lst) "classes")))))))))
           (course-check (rest course-number-lst)))]))

(define (courses-on-day day lst)
  (cond
    [(empty? lst) empty]
    [(andmap (lambda (x) (cond
                           [(and (not (member #\h (string->list day)))
                                 (member #\h (string->list (second (first lst))))
                                 (= (length (filter (lambda (x) (char=? x #\T)) (string->list (second (first lst))))) 1))
                            #f]
                           [else
                            (member x (string->list (second (first lst))))])) (string->list day))
     (cons (first lst) (courses-on-day day (rest lst)))]
    [else (courses-on-day day (rest lst))]))

(define (find-time start/stop lon)
  (cond
    [(empty? lon) empty]
    [else (cons 
           (list (first lon) (second (first (my-filter first start/stop (dates-directory (class-time-check (first lon) "classes"))))))
           (find-time start/stop (rest lon)))]))

(define (free-rooms operator lst)
  (foldr (lambda (x y) (cond
                         [(operator (string->number (string-append (substring (second x) 0 2) (substring (second x) 3 5)))
                                    (string->number (string-append (substring current-time 0 2) (substring current-time 3 5))))
                          (cons (list (first x) #t) y)]
                         [else
                          (cons (list (first x) "FREE") y)]))  
         empty
         lst))

(define (alst-gen alst1 alst2)
  (cond
    [(empty? alst1) empty]
    [else (cons (append (first alst1) (list (second (first alst2)))) (alst-gen (rest alst1) (rest alst2)))]))

(define (vacant-rooms alst)
  (foldr (lambda (x y) (cond
                         [(not (= (length x) (length (remove-duplicates x))))
                          (cons (list (format "~a ~a" (second (first (class-time-check (first x) "subject")))
                                              (second (first (class-time-check (first x) "catalog_number"))))
                                      (format "room: ~a" (room-directory (second (first (class-time-check (first x) "classes")))))
                                      (second (first (class-time-check (first x) "title")))) y)]
                         [else (cons (list (format "~a ~a" (second (first (class-time-check (first x) "subject")))
                                                   (second (first (class-time-check (first x) "catalog_number"))))
                                           (format "room: ~a" (room-directory (second (first (class-time-check (first x) "classes")))))
                                           "FREE") y)]))
         empty
         alst))

(define (inputs inequality1 inequality2 day subject building)
  (alst-gen (free-rooms inequality1 (find-time "start_time" (my-al-l first (courses-on-day day (course-check (subject-at-building subject building))))))
            (free-rooms inequality2 (find-time "end_time" (my-al-l first (courses-on-day day (course-check (subject-at-building subject building))))))))

(vacant-rooms (inputs < > "MWF" "MATH" "MC"))



