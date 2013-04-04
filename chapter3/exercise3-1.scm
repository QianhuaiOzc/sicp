#lang racket
(define (make-accumulator balance)
	(lambda (amount)
		(set! balance (+ balance amount))
		balance))

;Usage:
(define A (make-accumulator 5))

(A 10)
;15
(A 20)
;35