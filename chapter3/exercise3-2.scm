#lang racket
(define (make-monitored fun)
	(let ((count 0))
	(define (how-many-calls?)
		count)
	(define (reset-count)
		(set! count 0))
	(define (call-fun arg)
		(set! count (+ count 1))
		(fun arg))
	(define (dispatch m)
		(cond 
			((eq? m 'how-many-calls?) 
				(how-many-calls?))
			((eq? m 'reset-count) 
				(reset-count))
			(else 
				(call-fun m))))
	dispatch))

;Usage:
(define s (make-monitored sqrt))

(s 100)
;10
(s 9)
;3
(s 25)
;5

(s 'reset-count)

(s 16)
;4

(s 'how-many-calls?)
;1