#lang racket

(define (produce-tour-with-list coordinate-lst character n)
 
  (define (chess-board n)
    (build-list n (lambda (x) (build-list n (lambda (x) #\.)))))
 
  (define standard-board (chess-board n))
  
  (define (knight-next-move-lst x y)
    (filter (lambda (x) (and (> (first x) 0)
                             (> (second x) 0)
                             (< (first x) (+ n 1))
                             (< (second x) (+ n 1))))
            (foldr (lambda (x1 y1) 
                     (append (foldr (lambda (x2 y2)
                                      (append (list (list (x1 x (* 1 x2)) (cond
                                                                            [(= x2 2)
                                                                             (x1 y 1)]
                                                                            [else
                                                                             (x1 y 2)]))
                                                    (list (x1 x (* -1 x2)) (cond
                                                                             [(= x2 2)
                                                                              (x1 y 1)]
                                                                             [else
                                                                              (x1 y 2)])))
                                              y2))
                                    empty
                                    (list 2 1)) y1))
                   empty
                   (list - +))))
  
  (define (new-board x-y-list char board)
    (foldr (lambda (x1 y1) 
             (cond
               [(= (length (cons x1 y1)) (- (+ 1 n) (second x-y-list)))
                (cons  (foldr (lambda (x2 y2) (cond
                                                [(= (length (cons x2 y2)) 
                                                    (- (+ 1 n) (first x-y-list)))
                                                 (cons char y2)]
                                                [else (cons x2 y2)]))
                              empty
                              x1) y1)]
               [else (cons x1 y1)]))
           empty
           board))
  
  
  
  (define (knight x-y-lst char board visited counter lst)
    (define (warnsdoffs-rule x-y-lst)
      (foldr (lambda (x y) (cons (second x) y))
             empty
             (sort 
              (foldr (lambda (x y) (cons (list (length (knight-next-move-lst (first x) (second x))) x) y))
                     empty
                     (knight-next-move-lst (first x-y-lst) (second x-y-lst)))
              #:key car <)))
    (cond
      [(= counter 0)
       board]
      [else (define neighbours (warnsdoffs-rule x-y-lst))
            (define route (knight-route/list neighbours
                                             char
                                             board
                                             visited
                                             counter
                                             (cons board lst)))
            (cond
              [(false? route) route]
              [else route])]))
  
  (define (knight-route/list nbr char board visited counter lst)
    (cond
      [(empty? nbr)
       false]
      [(list? (member (first nbr) visited))
       (knight-route/list (rest nbr) char board visited counter lst)]
      [else 
       (define route (knight (first nbr)
                             char
                             (new-board (first nbr) char board)
                             (cons (first nbr) visited)
                             (- counter 1)
                             lst))
       (cond
         [(false? route)
          (knight-route/list (rest nbr) char board visited counter lst)]
         [else route])]))
 
  (knight coordinate-lst character standard-board (list coordinate-lst) (- (sqr n) 1) n))

(produce-tour-with-list (list 1 1) #\X 8)